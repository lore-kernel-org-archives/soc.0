Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF2DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 05:25:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BC964DCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 05:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BC964DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4DvGvbVmx2U5ET7HrzAX2GTfq67D+2lsRZn/UHmTosU=; b=QLUjQLt8cXczVJU5rbKCx/dZ2E
	3/s5woDU2dzT80Bqjs2jn/bP4yunWprPZJMYX6+3nOQlveoSoqD5P6uvs1QyUisgJVkqn1cq2nGUl
	NM/NxgkQOdpPeRdvACHXWm8Q9AAefxt3Zh47oAQOJ8fFOsjXQBBAt4/UWa+VRWu+4H08pnvmTKYDw
	lEFLEiXOyivo9NJfpEFbmczMcXRZ3CYXlrEJFrO2PvjXZdn41dsjsIuqIX6sW3JIHwYh0GUGLb+io
	fJ+yPhqSAE0bkNfp4OQlgLpzILgEAIjA4be6XCS5T4yNqk38wd3IVXGBRkqNOIqS/euH/XgGlLadp
	sqOqRzxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Rgy-0003m8-Fm; Mon, 01 Feb 2021 05:24:04 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Rgv-0003lk-Sl
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 05:24:02 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1115F0Qx086747;
 Mon, 1 Feb 2021 05:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=J3ocIIW+svtR/frilWI593lhmK57A9OV8Lt0oZoHqdM=;
 b=GES0QwrrcMEOcerY376N17zaPYHCdpVsCzTfhOPqqq1Gcd5LqTEQ6Bn2ZLRscCoZXRqu
 ifcjZ/1V0e3nIHNr6HLu8I+3YjkJ5C04Su+xwfjGFakAuyJ589rpfV+CaVVGhcMukgFt
 LYLdLm5LtediTz6ARpIbiRlahDQR4+T2ofqqL5hHKU/Af6lVNDDJ1fvHCNkFLp3MVYyH
 QCPQJ80up34pOwrAUQiL50MB/OEtt2lXAK3ESIgCl1hffurQzdeRP7ojSPefi3Zdw908
 LF05Oq8VUnxUlNb2mpcvL2OW9IlEFVW/Sg5x4d3+Z//IArXBh093W6r/4K4Mru9PI51r vQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cydkke5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 05:23:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1115GQwA035059;
 Mon, 1 Feb 2021 05:21:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 36dhcuej2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 05:21:55 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1115LsnX016367;
 Mon, 1 Feb 2021 05:21:54 GMT
Received: from localhost.localdomain (/10.159.236.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 31 Jan 2021 21:21:54 -0800
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
To: arm@kernel.org, arnd@arndb.de, olof@lixom.net
Subject: [GIT PULL 2/2] ARM: DTS: Keystone update for v5.12
Date: Sun, 31 Jan 2021 21:21:50 -0800
Message-ID: <1612156910-11159-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102010025
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_002402_065400_EAB95652 
X-CRM114-Status: GOOD (  17.23  )
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
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, santosh.shilimkar@oracle.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201052150.wJ-iOk8TLvGotjDwp1KL9d0aOh0I9VnmPe3eGcjxHsM@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.12

for you to fetch changes up to 091584182ba6a298351f1e555c13ceb880c1f397:

  arm: dts: keystone: Harmonize DWC USB3 DT nodes name (2021-01-24 20:50:48 -0800)

----------------------------------------------------------------
ARM: DTS: Keystone update for v5.12

Contains couple updates for DWC USB3 DT nodes

----------------------------------------------------------------
Serge Semin (2):
      arm: dts: keystone: Correct DWC USB3 compatible string
      arm: dts: keystone: Harmonize DWC USB3 DT nodes name

 arch/arm/boot/dts/keystone-k2e.dtsi | 6 +++---
 arch/arm/boot/dts/keystone.dtsi     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
