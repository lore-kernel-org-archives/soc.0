Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEF3C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 19:40:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B25206E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 19:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9b5nLTH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="wyywyIba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B25206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fO045afemrGO1cBqWm9H7QZAKO0+B0aRZV6WrLKjGwU=; b=S9b5nLTHjirUz5N5ToKOy2phAc
	ER7hOkyPQ7J84QZG0+7IgeON/jviuLEAUMxSRgJnUSthR42euMgyNBtUvyyVN+/FMQT3dm+gFvb9h
	51Zbf0WHLvOyGdRF9mFAMaRHy+H/p4Imig1mmYB4Tu7rANcb8YMoyCuxgaTVRWwCYq9cNuv1pyr38
	zRTT26FqwJKE+xNQND6+mwrico6GZYeuzFVfH1hIYZQT2SYk6IzMdJ2dZFvw7v/cs0dcP1j0eOOPe
	7jLUJ/nTZRLiOdN2UxQB5skeJYJyHchHZY6lAd5Cms9zgl796LgYpIOf6e6PgzN4oI0BHZc1ZEvsJ
	YppjfMZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBUY-00070t-P8; Tue, 01 Dec 2020 19:39:14 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBUS-0006xX-Bg
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 19:39:12 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1Jcu2x098710;
 Tue, 1 Dec 2020 19:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=o3rs1gQs878ZsMzbkxh2V3i0uCl75W9OVAYYEFwz/FM=;
 b=wyywyIbaMJM79jGkslYwgyIEcPdP+hvYbN/280vSqmErqxp3n4M58xETUs9FyBuMclpu
 4tl3P8nOmzcENvv4DbZIiyzXQyRSupiEYzDP0HhDlqaF/Bydev6/l9bXjfyTc0WALhkv
 wmDNxsKUHlRRrfkIrH3XS06+RZ0Nq+pfDTsmv1cUNUYP4+wJrXX0uOTUgT9+9jyW/FQy
 1pVZQ2HvaoTbn/4j8AW+7N393xgJ8qR05kXa2MSNjvG/dWPWSPfh1It0Rh4eoP9H6Czs
 1IQ9JEHn1QhJiJdyAShBX+1EAuI4muqV4borvakcgouNPh8GzVwONmTcXrNNOInUNjrU Xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 353c2avk4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 19:39:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1JUPKx168538;
 Tue, 1 Dec 2020 19:37:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35404na56c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 19:37:02 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1JaxKQ017275;
 Tue, 1 Dec 2020 19:37:00 GMT
Received: from localhost.localdomain (/10.159.239.17)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 11:36:59 -0800
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org
Subject: [GIT PULL 1/2] drivers: soc: TI SOC changes for 5.11
Date: Tue,  1 Dec 2020 11:36:45 -0800
Message-ID: <1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_143909_010187_9C4ECCDB 
X-CRM114-Status: GOOD (  19.32  )
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
Message-ID: <20201201193645.twmrdlVcwrqsPpJ264O9k4L2KvBpTunXt_oiqzOwgQg@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.11

for you to fetch changes up to 4cba398f37f868f515ff12868418dc28574853a1:

  drivers: soc: ti: knav_qmss_queue: Fix error return code in knav_queue_probe (2020-11-21 19:22:38 -0800)

----------------------------------------------------------------
drivers: soc: TI SOC changes for 5.11

- ti_sci changes towards DMSS support
- Static warning fixes
- Kconfig update for Keystone ARM64 socs
- AM64X SOC family support

----------------------------------------------------------------
Grzegorz Jaszczyk (1):
      soc: ti: pruss: Remove wrong check against *get_match_data return value

Lee Jones (6):
      soc: ti: knav_qmss_queue: Remove set but unchecked variable 'ret'
      soc: ti: knav_qmss_queue: Fix a whole host of function documentation issues
      soc: ti: knav_dma: Fix a kernel function doc formatting issue
      soc: ti: pm33xx: Remove set but unused variable 'ret'
      soc: ti: wkup_m3_ipc: Document 'm3_ipc' parameter throughout
      soc: ti: k3-ringacc: Provide documentation for 'k3_ring's 'state'

Nishanth Menon (1):
      soc: ti: Kconfig: Drop ARM64 SoC specific configs

Peter Ujfalusi (11):
      firmware: ti_sci: rm: Add support for tx_tdtype parameter for tx channel
      firmware: ti_sci: Use struct ti_sci_resource_desc in get_range ops
      firmware: ti_sci: rm: Add support for second resource range
      soc: ti: ti_sci_inta_msi: Add support for second range in resource ranges
      firmware: ti_sci: rm: Add support for extended_ch_type for tx channel
      firmware: ti_sci: rm: Remove ring_get_config support
      firmware: ti_sci: rm: Add new ops for ring configuration
      soc: ti: k3-ringacc: Use the ti_sci set_cfg callback for ring configuration
      firmware: ti_sci: rm: Remove unused config() from ti_sci_rm_ringacc_ops
      soc: ti: k3-ringacc: Use correct device for allocation in RING mode
      soc: ti: k3-socinfo: Add entry for AM64X SoC family

Tony Lindgren (1):
      soc: ti: omap-prm: Do not check rstst bit on deassert if already deasserted

Zhang Qilong (2):
      soc: ti: knav_qmss: fix reference leak in knav_queue_probe
      soc: ti: Fix reference imbalance in knav_dma_probe

Zhihao Cheng (1):
      drivers: soc: ti: knav_qmss_queue: Fix error return code in knav_queue_probe

 drivers/firmware/ti_sci.c              | 213 +++++++++++----------------------
 drivers/firmware/ti_sci.h              |  72 ++++-------
 drivers/soc/ti/Kconfig                 |  18 ---
 drivers/soc/ti/k3-ringacc.c            |  98 +++++++--------
 drivers/soc/ti/k3-socinfo.c            |   1 +
 drivers/soc/ti/knav_dma.c              |  15 ++-
 drivers/soc/ti/knav_qmss_queue.c       |  66 +++++-----
 drivers/soc/ti/omap_prm.c              |   4 +
 drivers/soc/ti/pm33xx.c                |   4 +-
 drivers/soc/ti/pruss.c                 |   6 -
 drivers/soc/ti/ti_sci_inta_msi.c       |  12 ++
 drivers/soc/ti/wkup_m3_ipc.c           |   8 +-
 include/linux/soc/ti/k3-ringacc.h      |   5 +
 include/linux/soc/ti/ti_sci_protocol.h |  85 ++++++++-----
 14 files changed, 272 insertions(+), 335 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
