Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA836E466
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 01:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819451; cv=fail; b=a/cLMkDcRlXlMLuQoTYUzHbAL8oADR6TDy1NhMPQ1ZON8Jih7+QczcyZ66kWQrh4tBgbQv7WLApg2kafONcA4tIzSgCO7j5nuH+P/Tk+S2PZylrImLHzAv5JHLWZ5F34fq80e1Br5lgcOYCy6kSJMoMglnifNBZzlUxbC60aP4c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819451; c=relaxed/simple;
	bh=TBGd+hbldNvTZI9TM6aic7odYDUBt4wO06+UEXbwEnQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G4JV0PfaH7UvH0ePNVLSkEGWXgtVfbtBAXbBFZ/STPISPrge5DIV0OxurQ6uckvqWa6MMStNLbQp/NDJJaBEQbt4dl5/ag8vvzdINQr3uNqR/RrQAWsYPtc/TyBUibmRhAoXJwrYinHQCCECO9y3dIZGkCD3DwlpeJFIMHS7WXg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=aAu1UGm1; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="aAu1UGm1"
Received: by smtp.kernel.org (Postfix)
	id 072101F00898; Thu,  1 Oct 2026 01:50:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.130.202.132
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790819448;
	b=Q1sCDQ9LJQvmdUS1ERr+Pdfy17FCbzgxNi4FPmYgjd8BSew0E/d1SC0Ffi7eKh3GBBTi
	 MhAlSAgxdUHoGAfQ9nVbQdCwdHCDYoNjna72B0Pfv1vVenmn4my3RHjZ8FNceakeI3zsV
	 jQxMFLkwf6krJFbtoKBFshYHtUEf9hjH+G5nRVKMyOVim+4cDn8k2RgGlyY8bfUbdy/D4
	 lA/Tjf39qdUF3Dzl/JMAWHJ/5eLAdpV2cbtmu8ySfgWq20cpQoIc3PecQQ8bkuGw/g95a
	 uYTMZ7Nf1H5BM/MgcuUiSWSgn7ysaNYX3XTlj99CKn/A4Q9a0KHKTnt2nLZq/aXcF3A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790819448;
	h=DMARC-Filter:DKIM-Signature:Received:X-Iguazu-Qid:X-Iguazu-QSIG:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:X-TSB-HOP2:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=R1+43rlpdgTOVCgb+d7heyJtM6CdCQ9Jo1vRzhK+6sA=;
	b=RNcCI18XwJaGSETPFD8y6y3lTCPA+Bi2C/l4D4oi8YMof0C+t08m9dIucUfIkFs1YU/0
	 Q8wF6+Iuij3x8F1dHzc8ZN3hZaMkE0dyS7WrrInqqrjf7gpSVCY2CaXUwOn/ZmUVOl+kq
	 JshHEf1UjCqpJXf0YG3zI67VcNXisqAF5dUoEcSt39VzPN3yi/pFae//DbCrVzSaA4PDb
	 6fzeYHPYrpTAOCA3+vP0SeQc14kJq1k7YhPBWVO3WV+kQ1pKhBc+GTEP1ZINv6FGhbp9J
	 UktHqe3UK8aETv90mCNUVTMLr7Nrx/xCFok5Y7flGW5i6wPn6Q7h4H65Nfkss3xjnqw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.a=rsa-sha256 header.s=key2.smx header.b=aAu1UGm1;
	dmarc=pass header.from=mail.toshiba;
	spf=pass smtp.mailfrom=mail.toshiba;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.130.202.132
Received: from mo-csw.securemx.jp (mo-csw1121.securemx.jp [210.130.202.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 070A41F000FF
	for <soc@kernel.org>; Thu,  1 Oct 2026 01:50:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.a=rsa-sha256 header.s=key2.smx header.b=aAu1UGm1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 070A41F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key2.smx;t=1790819438;x=1792029038;bh=
	TBGd+hbldNvTZI9TM6aic7odYDUBt4wO06+UEXbwEnQ=;b=aAu1UGm1fzOMMRFwMgt/f6I/togz7n
	ZRVsBCFF+FR2sqDBkKJk+oihn9l+4LLjR+7KY3BCpIb2EB7VGUnC82dph3QkhMxeRusoJsowjtII/
	ULV587VtGkoRTJ14zTrj0O8g5lxVphmVESBvIIDX0gPIdNdn6RU9PlGmtxMjiS7PUKXZTLtjDqabN
	jXzBSHgKfW+dbe5DtaY8Arz/d5J/XnSijWd2BeXHL7vh8+Ko1apG21A1/KhJqwU2HySG62092SXUM
	cBSG/EFtJFMOgdrV5SnsVx3R3orLv9aq3QanATYufn8/mELC9/qrr1y1j9DinrPh0qvUeh6xSWGAc
	Vdng==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 6911obYH2588868; Thu, 1 Oct 2026 10:50:37 +0900
X-Iguazu-Qid: 2rWgSEmgZgodJrEi0O
X-Iguazu-QSIG: v=2; s=1; t=1790819437; q=2rWgSEmgZgodJrEi0O; m=SDz/tRBHeaTBT1yzWhKLQhgPOgRNYf5nu9M08DoXoio=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4hwFHK2zc0z4vyy; Thu,  1 Oct 2026 10:50:37 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzdNbZitFcHsvbTuIMH26CwMMAwQWZ+Vtt8W5gZEImhnaEHXFoBK1zdJfeC9LUdrRxVRjBREQx02LQWXXw/uWJhWry22YWzbpUtUBIf902V1UWCHp5OAHYytniYcseZr7u9OTitgPi7XHPUKGkoVKqTOb61kmPITqPSrFpyb888pNltzhjzcrrbfFbUZPMxkaYnwq6E1f43jBYpl36dXa10fuf4DIP+QpYk06In0Vkywdr77fEZEDSA4JptR0BSMsxYA07QaE1maQeESpAKBmGE7VU5ev6pxQedEzO4QvxmDDngw+9/+hRcoo72u1RsIKGJvOMiyve2IM/Gv3Fg4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1+43rlpdgTOVCgb+d7heyJtM6CdCQ9Jo1vRzhK+6sA=;
 b=sLWga4QS2OirWzcmvvviZjQXO8cvmf9ZyaKWvU0wmY/EeByhQJwX50RWC1JUddLL/00GCf1UdgEcHLSaF+IIUmH332lmarX4WlS4fnQz/DTJTdSiUiLkxqzdDYuzKn/TGGsszWvdO0Z9CN/6tXiEIDDQELMlgUHpP9zFrVYbWr4ZY/I+vXnLr2V3YXF+Mi4mnj4tFuxz8A+CE6wLaT6By6IP6ZpoiarRP3ZYZwiYRykLEW5nEjUn5rAnmXRQb9XOXnO10hSmfSAIl82fmn5Cv0UVI+pp+yEY+3lBfIdJH81uOcLExisJ5l9e55SuU3XrtzJHrnvtUI6O6q87aBMmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <soc@kernel.org>
CC: <yuji.ishikawa.x51@mail.toshiba>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] Visconti5 SoC Changes for v7.4
Thread-Topic: [GIT PULL] Visconti5 SoC Changes for v7.4
Thread-Index: Ad1RRxQ5NE//uJR4SNW2pYvpyKsbIA==
Date: Thu, 1 Oct 2026 01:50:33 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB14818E7E9984CE8F0B260CC73CD8A2@TY7PR01MB14818.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TYCPR01MB10396:EE_
x-ms-office365-filtering-correlation-id: 280e7f90-7363-422c-d92a-08df1f5e61b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 28gxjG4po427aDOerZrhxcUFnDH2elC8psd5mMNqOGeGDSdBcUnSoGBdyxaDffBYmIp6asg6jVfA78XXMc/VIKTs5EI3I6xEQAVwDv+m9L8kxVhKwHlJ58AyGqYWVFbQwppbJom4C60tNyy/G3M4CTGNZ6rPqB0isKzO9rliwKI0A5IjdGxUBS3FoxwpPZ/K2GGr3I7Tv1LvlnghQCxMdWqWesKk73APP5iVGT4CdGQW9fF6HjZEJ5/63Rqm66hljkp0QzF1QuDWfJiY4hLDJ8HjfWtT8p6HzxsPBwG7NyisvffRNpG0FFnkN1gtVQy4G1wAcpsvOh897Lc9AMRatKUard74PeXlUMC1bO2gzXiORSsE/8X1VBwjb9DemZ1/LiQjGkM4na30ZnGvXClIBYF/oEf3mLEXVZbFHwDKkvHugh24sv6uxl4Ga2StkIvyaSvVNAFpRBHGsmWmOc/ty7WbLirWzB9/abAe8pfXHrFmxVDrrRbkLHyjzdgUH6MciVORNlw7/Gi86+F8GRX2rL7IuRQBg0qw4kNC0fnu4+x2amkcu0vSTyDHON4RxLZzsApATcZoETT+VzHRmtuvwiaj23fquTdKfdj0CsYZldfmRm0pkv8uAYbsgT70OxPTEsrW+IBZ9Ap6zZRgYic7u6PKAzA78sTpvK8vRvcqQ1cyOmcABVFVJwQW0lXavhdZWjAz08vn7zRKhjQMvpDTN2JvHaqkjSmy3cm32A+qWwg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?d0NuSlVOOUxsd1lrVXkyV01PUTI2Mm9EU0RSU0JvbTNMRUp6RU9IcVJa?=
 =?iso-2022-jp?B?VXY3d1UzendyeHUvRmhDMVZQbG5YNmtOYkxtQnRHWk9XMzBGbE16VzJt?=
 =?iso-2022-jp?B?U3VhTGVhd2dMZ2l0dWxseEhndFJyU25EdVhBRkZaekpyRTZwbFdKaTZ3?=
 =?iso-2022-jp?B?VTRyRStlYlE4anNzcHFsWjFGa2RaTURxZ28vVWVVQkNmcjRjUXhCdmRl?=
 =?iso-2022-jp?B?dDlDalVmd0J2aVIrdldhZG95YVNYMTlmZEQ0WGhVNG1lUUR6VzBHY1Vn?=
 =?iso-2022-jp?B?MWFTc0p5QlVoMWJBWnNCWVEwZVdvekV3dGdlOGJrdW40ME03WDI1eG0y?=
 =?iso-2022-jp?B?MWxKRDNSd1BoUTFrL2RBZ003S2hMc1UrbVpZb0tPVW15WW1OS0NxaUVa?=
 =?iso-2022-jp?B?VVE0SXZaVlRBWTlXYTJoeTJmMkpPSDhOTUQvZlgra1FSc3FtRFVpd0Er?=
 =?iso-2022-jp?B?akhXWEc1d2ZMYjA2SURXd29yUzJnSjhncy9IQWxUSFVSaU5ld3BFR1Zu?=
 =?iso-2022-jp?B?V3lucVFKTS9SR1RVS3lLb0NOMVovT2hOWXdwRFFSblRhUCtBU045TXU0?=
 =?iso-2022-jp?B?ZW9Eck9wZFFpRlFlakNOM2dMZ1FhMVQ5ZDlWeXJPRXRkT04wKy9qQS9p?=
 =?iso-2022-jp?B?eFhlK1lyTGpGb2J6ZEZIZXRPYmxTNHA5UDlwQXJySHpKNnl3MmpXbENw?=
 =?iso-2022-jp?B?djltZWVPVnE4M3RkazB0Z1dVZjU3OUdYdUxtVFFmQVhhK285TDlNQWJP?=
 =?iso-2022-jp?B?S0IrWFpPMDdqVkIyRmFORGZlN1BJR3pSUDNQMXJxanhZdUJFdGJaMkdq?=
 =?iso-2022-jp?B?SDVvSnFZcVhYcTFjVmRpZFdPRHF3YWxMTXp4R1NQVnFxdUhEL0EyMmRI?=
 =?iso-2022-jp?B?RktYelNnT3hwTEk4eE91cDZCVUNTYkhmRDJvSE4yMnRVZzM3NEVrVHI1?=
 =?iso-2022-jp?B?cUxNTnU3SFpGK1BQOGdmdGViU2l1VE1MNVN1QnJkcWZyRmU5VjBzZXhT?=
 =?iso-2022-jp?B?STdCczg3dVFUdjgzZER2TU52ckxZOGhHRW5McjVCeGR5VjlmRmFqS0pC?=
 =?iso-2022-jp?B?TXFINEdzNUpCSWFRenFocmRjc1hLeUQ2WWNvMzR3c1h3dnpYakRJblJy?=
 =?iso-2022-jp?B?aE1lTnByOEhQTVEyV1FVSVZxWDVuaC9GQWY1cTBnelNhSFNJQndjWU9r?=
 =?iso-2022-jp?B?SDdPNm43V3h6R0dCVjlRL0FMUWpxbVd4RGxvVUpQc091TUNxdUg2T2JC?=
 =?iso-2022-jp?B?ZE54aVJlNEhUaE5SaDhHQVgwT3N3bkltRHMrekI4QmtNWDhkTnVTMHp0?=
 =?iso-2022-jp?B?TFZ5YzJyT1NsSlhsTmFtZEc3L2xVUmVUSEFXcC9lUUxaL2Y2WVJzVlpt?=
 =?iso-2022-jp?B?TEp0ZWhiRnkvY085NzJzam8yZ1BUWHVqa0lUSGNCaFRTdzNyMGVzMThK?=
 =?iso-2022-jp?B?QUUvMm5DOG9mc2FtM24zWUprY1BUTE9JNmpSR3Qvalp0NGJjckxXRDh5?=
 =?iso-2022-jp?B?eWdYY3puQ3hHYThrbmNtTnZDckJBSkZVZGVFWExqeHpudEg4MXAxOWdE?=
 =?iso-2022-jp?B?b2hTMFg3OXBueEJFOXovSFZEcUZwSXo3MkQrOWN3Z205SzdveFBvY3lq?=
 =?iso-2022-jp?B?MS9BNVd3Y2hNOVdHSDlnUnRSc3k5d0EwOTNYZitvK0Znano5ZjVFTmVL?=
 =?iso-2022-jp?B?RDBybTUwZTd4WS8zSVF0eEpVOXdnNzM5VC8zcnM4L3kvdW5ITEMvOXJp?=
 =?iso-2022-jp?B?R053eStOSkt2ZTdkVjd2T2dBS1ZsQ2V0cmpyTUt1d2RpZnFlMkw4SWRw?=
 =?iso-2022-jp?B?NWpTOE5rZDEvdDdISTBKeWdPQXJQKys3aVJ0MFZQeWRMaUlvdDdKbWhK?=
 =?iso-2022-jp?B?TTh4VDJpQjVoak1mcW9zUUZ3WkhPcmV1NWlrcjNNUmdlc0wveVJBZXRQ?=
 =?iso-2022-jp?B?MkpFeTl6Z3YwRExuQkZFb04rUW5JODErRitlUWJ0UjdWMlRQUTl4NXhD?=
 =?iso-2022-jp?B?c2dxWkgrVm01ZjNRYXJlOWMzSndGZ1RmeStwZkFjelV6Y0VlUVBQb3Rq?=
 =?iso-2022-jp?B?SllPajJVZTVjaFJtWmk3QUdpVVFJWW5uNFhYVGd2clRMTjExTTdWTXhs?=
 =?iso-2022-jp?B?OXRoRiswMy9nU0pnTmhFZkVzUFA2dXdnUTV4TVFuTkd6OVdvNXlYVWZ6?=
 =?iso-2022-jp?B?Ny9kdFpOV2x1R1YvcWRjS3Q1d0FYVUhFalJiTVFZdHY3VDA2Z0I2T2M4?=
 =?iso-2022-jp?B?djRJMGF0c2FJNE16bm1Qb3FiRXhtT04rMGJvNzJpYnQ0TUpmRThvRGNq?=
 =?iso-2022-jp?B?MXQwUDR0dFYxd2ZNcFhyKzJPbFhaakpXaE8zeUU0T3pBb2cyREo2bG96?=
 =?iso-2022-jp?B?RkVwdUtmeWZkc0pLbWtaZDNPelh4Uy9ZL2dNdHFBbmNyTEgyL2NLZG9P?=
 =?iso-2022-jp?B?dlNlNmJyNUlZWHlodUdBdnN3OWdiTGxhaU1rRGxtQytsZFJ5NkhucWRy?=
 =?iso-2022-jp?B?aUFQc3FXWjJ3ZWFMRnVlMndQVGloMTJLL3FHUDZveE9yTlRnZ3B4dUNU?=
 =?iso-2022-jp?B?clJFR0xoWT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Obdi5lJEIsIeCU84VgUubc2RI7y1QgcQdMjATGkrGjdzflPcC78u6wdHw94A8fwk5yLVZKatW7UDCLlHgqpsnm+1VDOSSJnkwQdFz1iw+fAqdfHQDIa56jBS5qIEKRM2LLy2YJrr8Wht3PhDwZes42kuIamDJ39YyJKa+HmTpQwZygA3GfkvI/Fnihj/WBRZYcpcQ+Y2ghYLJY7UeHr1jBI3Ldu30B4tomhQj61u+Ds1kRqteNFPgc0u0dPcaln0wrOteEyoBJQSR7c/UZGHfcvWzFcySeHi5zfY0eDDKFg2H6+8Xvg9wiGz7aGeXqz8umDbN8P3xVXnCiXbM5IcLQ==
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280e7f90-7363-422c-d92a-08df1f5e61b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 01:50:33.6060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhGfeQZVkfRL27KU73SWVm7nR1rlKSgFhvDXIItzHD1CCtpVwgfG8S+rAPnLCW2q3DmJmw/Wo29qQYyPNkUNR+YY/+wRaDvjBcI8rBwAM/MENvpZxBB4NRc68umZ4BzX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10396

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.g=
it tags/visconti-soc-7.4

for you to fetch changes up to ed94e2913d0e1b0e242913ac520ce5d56cb86bc1:

  MAINTAINERS: Change ARM Visconti5 architecture maintenance status to Odd =
Fixes (2026-10-01 10:12:01 +0900)

----------------------------------------------------------------
Visconti SoC Changes for v7.4

- Change ARM Visconti5 architecture maintenance status to Odd Fixes

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      MAINTAINERS: Change ARM Visconti5 architecture maintenance status to =
Odd Fixes

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

