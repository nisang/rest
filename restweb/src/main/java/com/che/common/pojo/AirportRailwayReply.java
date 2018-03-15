package com.che.common.pojo;

import java.util.List;

import com.che.common.entity.AirportRailway;
import com.che.common.web.Reply;

import lombok.Data;

@Data
public class AirportRailwayReply extends Reply{

	private static final long serialVersionUID = -4404576974137969771L;
	private List<AirportRailway> ar;
}
