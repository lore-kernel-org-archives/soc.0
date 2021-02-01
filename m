Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68063C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 05:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC8E64E27
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 05:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC8E64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ssJ6JR0V0Nbq2J1rTX27OMwZ8KTD6awAgVmSOZQxAI=; b=WtpzoH57TLoRdFfatSjoR1tn8c
	wONX1d74sZWxAqvHRX4Q+5nZck22JbVPgZGujWmH9mvcgd7rCrjkp5r3s4E1E/tdFmqVbXUAi6jN5
	mev23UDuuAWjZ2iXVqIIqxSWS2qpDGaI+do+it1NjUMIujz3QlKn3xpJIpKQt9Mh0JwVNqkWuCWsL
	qPAumnngJ5NnVZKODXEXdPADW+eZZ/GvKckOsuiGwjPsifsqqc+sebtTe4y45wUMvBIpsoJPVH1fl
	FAvAbs7LDz3hJlL9sMRTCowx/o6SYvN63VVgIwn5M5sPTQNct7XRvFFCJONnxJHMlyymdmXPw0Wib
	q1QcrHGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ReO-0003eS-OR; Mon, 01 Feb 2021 05:21:24 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ReM-0003e3-QE
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 05:21:23 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1115DZ0W179837;
 Mon, 1 Feb 2021 05:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=NGNMP8cFJbPPBvx3gcdqk3xsHqfUkWSZAztQLufqfb0=;
 b=F3OdNfR4u0UdmokB+ZUNPeVf8xyoTdVp+HhEQmo9ZnF/kuU2mx7W/LLcPQZA2wNexjKX
 PqrsijZtEJE3qOQ8QdyZ0UW9La7cxWGalgxZiHocLIxkOSqibjLvsCSGr8g8ld7X4FpU
 551cdWLtcgidRXsCaMNyIHjvDhlPYwu/zJBiJP3xW/mpMYhojbuFFztBgvZ7sBSXaKsI
 CPOGqUe9exVrVymX+ajfsiwW1vwogZjfBKWojwtl5KyQEblUV0VR4rVzxPNcprwB5pQt
 fKfyF1rVxPbt+fOVeQxamyzWUBpYJ5zicjoA8xA/uC4EUQjPtn6uzIUTeCCe0wVec4B+ HA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36cvyakmf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 05:21:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1115G4R8179597;
 Mon, 1 Feb 2021 05:21:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 36dh7p6x4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 05:21:10 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1115KxLL015567;
 Mon, 1 Feb 2021 05:20:59 GMT
Received: from localhost.localdomain (/10.159.236.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 31 Jan 2021 21:20:59 -0800
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org
Subject: [GIT PULL 1/2] drivers: soc: Keystone update for v5.12
Date: Sun, 31 Jan 2021 21:20:54 -0800
Message-ID: <1612156854-10929-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010025
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_002122_968037_2EEEDA15 
X-CRM114-Status: GOOD (  17.15  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arm@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, santosh.shilimkar@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201052054.DcI5yyPTclG4qaZQTuMi0hhPz2fMR_amG6kH4cNHpP4@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.12

for you to fetch changes up to a8fc8e5b8e42c4401d009143a5fd822ef3d0c9df:

  soc: ti: k3-ringacc: Use of_device_get_match_data() (2021-01-31 20:58:49 -0800)

----------------------------------------------------------------
drivers: soc: Keystone update for v5.12

Updates include:
	- Navigator refcount correction
	- probe fix in pm driver
	- fix clock init for PRUSS
	- PRUSS binding doc update
	- of_device_get_match_data() use in ringacc

----------------------------------------------------------------
Christophe JAILLET (1):
      soc: ti: pm33xx: Fix some resource leak in the error handling paths of the probe function

Grzegorz Jaszczyk (1):
      dt-bindings: soc: ti: Update TI PRUSS bindings about schemas to include

Suman Anna (3):
      soc: ti: pruss: Correct the pruss_clk_init error trace text
      soc: ti: pruss: Refactor the CFG sub-module init
      soc: ti: k3-ringacc: Use of_device_get_match_data()

Vasyl Gomonovych (1):
      soc: ti: knav_qmss: Put refcount for dev node in failure case

 .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 76 ++++++++++++++++++
 drivers/soc/ti/k3-ringacc.c                        |  7 +-
 drivers/soc/ti/knav_dma.c                          |  1 +
 drivers/soc/ti/knav_qmss_queue.c                   |  3 +
 drivers/soc/ti/pm33xx.c                            |  5 +-
 drivers/soc/ti/pruss.c                             | 91 ++++++++++++----------
 6 files changed, 137 insertions(+), 46 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
