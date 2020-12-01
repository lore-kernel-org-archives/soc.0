Return-Path: <SRS0=WUzl=FF=oracle.com=santosh.shilimkar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FBDC64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 19:38:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B64E12168B; Tue,  1 Dec 2020 19:38:08 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E87206E3;
	Tue,  1 Dec 2020 19:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bj/6bdaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E87206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=santosh.shilimkar@oracle.com
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1JStvW028745;
	Tue, 1 Dec 2020 19:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=icGZiE7CqQVpgl3NSw36TWd7Ec78vKPFhrflFFzlv9Q=;
 b=bj/6bdaFO/G8aV3oZ4On3Vky0mdwM97THgM/P1+5Sk6e3N+egpnDzQboE6E8aiQXZSmH
 obt2EhPKtkjMe2Zfribabsz7pfc/mlZmlWT8xMuwl3co13s9nNarrnN801tSJrWmx4ff
 i+y8rszfHX+izjs5taianvi+NW2tK1OqtbJc4qgjltdOKFPGNmpoLxMSXvUC76m3JNk4
 qLxsG+oBthHEZ8ONOYw+O2gy3K6gkxrX/06pn0LdM3SgWGBYeZZalX98tBUqE5hWf//I
 4Lle1lLF9jE/6GHebCeDLc00RWXwGUHhSm/TPHVCs/0yCTBC6WMtGamFsi6hFoKg3Yhd fw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 353egkmdeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 01 Dec 2020 19:38:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1JVLwD063814;
	Tue, 1 Dec 2020 19:38:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 3540fxfbhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Dec 2020 19:38:04 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1Jc38F019892;
	Tue, 1 Dec 2020 19:38:03 GMT
Received: from localhost.localdomain (/10.159.239.17)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 01 Dec 2020 11:38:03 -0800
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
To: arm@kernel.org, arnd@arndb.de, olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        santosh.shilimkar@oracle.com, soc@kernel.org
Subject: [GIT PULL 2/2] ARM: dts: Keystone DTS update for v5.11
Date: Tue,  1 Dec 2020 11:37:52 -0800
Message-Id: <1606851472-26593-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=824 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=838 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010118

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.11

for you to fetch changes up to ea270ef71db64715cb46d15b85f30e77775ff88a:

  ARM: dts: keystone-k2g-evm: add HDMI and analog audio data (2020-11-21 19:26:32 -0800)

----------------------------------------------------------------
ARM: dts: Keystone DTS update for v5.11

- HDMI Support
- Analog Audio data support

----------------------------------------------------------------
Peter Ujfalusi (1):
      ARM: dts: keystone-k2g-evm: add HDMI and analog audio data

 arch/arm/boot/dts/keystone-k2g-evm.dts | 112 +++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
