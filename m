Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F4DC48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 06:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EFD611CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 06:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EFD611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46jb1MWqyaa1GaLCfc3HfTs666dtUmlHiaOT4JRUt7Q=; b=ugZvDlWQSdGHwr
	a1Cym//0T9Rt6bCyr3NzIGbQfHuJkgKZZl+x+L7+SFVRCsqqjLCLupUWTskMAEYWWba2BGI3Ao+CA
	KXYlrhpAuOUsKXwShyuH02mqJaQNiy/FtQZdYVRgo3OSWa7g2QsYDyGj3EVLxrr4iaE4fwBftTBKO
	7JKxTRxvhbJbkBQDP+3eGwoGFXRSvs+mXF9r3YVRQ60mKVFRtRu55HywcmRGRs1MyoIHPCq134Lue
	WuaAariKyqACgpUwnlxp573eGYGYjs384DtIE+GbyC9OhSHMeLinAkIWS02mm0bfWjsRzQE8N0jjM
	fl9fr6JLAR8KVYHDDvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJC7-009m19-3U; Sun, 13 Jun 2021 06:02:03 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJC3-009m0K-8O
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 06:02:00 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15D61q4H055186;
 Sun, 13 Jun 2021 06:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=QrRNt7cFTy927GgLiaf/L5hOfMtw3J/e2HUHy/eTuFc=;
 b=YuUWVA+sahTgWr9PaEX8RyVFoxhT2NPBOlCfRw9zK0Wfh9RW88r8pLPoCFdyAWcNflQr
 q92vW2NpT978Ks6WfMdhY63QT9uCIs2rq/LyvZ5VlvUMTCmAysCr8Qk1itllF0juqG+q
 Zk8PedGoDIZhmwA4bwCqtW6CGbHtYLMNtirOnN5HqDMeC2W9CMVEOeYPCkZEUKBa6aQz
 ZNqBjtpMOYya1MCEOQXu80GFU/4fHDBiiq2NjG9jTaGOcIF7kxIUlo4xA36AXu+g5Y4D
 jVyGx+PvubEmjcBuhMKXscF/gBT17es0W7esDlXE4RggUKUfenAnWWqnko612sMxDu81 Sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 394mbs9es3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:01:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15D5tUpp015537;
 Sun, 13 Jun 2021 06:01:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3956pp6kvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:01:52 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15D61p4M030529;
 Sun, 13 Jun 2021 06:01:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3956pp6kva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:01:51 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15D61oRA009961;
 Sun, 13 Jun 2021 06:01:50 GMT
Received: from localhost.localdomain (/10.159.245.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 12 Jun 2021 23:01:50 -0700
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, santosh.shilimkar@oracle.com
Subject: [GIT PULL 2/2] SOC: Keystone driver update for v5.13
Date: Sat, 12 Jun 2021 23:01:45 -0700
Message-ID: <1623564105-10273-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-ORIG-GUID: Zv9n8edbUr0aFEynaxHRSPgv2lBLeMga
X-Proofpoint-GUID: Zv9n8edbUr0aFEynaxHRSPgv2lBLeMga
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10013
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106130045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_230159_452956_636C996E 
X-CRM114-Status: GOOD (  12.33  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613060145.RHbdUZ-PDUdARjB_F1XEmmvuCY-t2aT5wxdpDDZaLyU@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.13

for you to fetch changes up to 536e23c607edf0e13092887b92e0d5c7d29462b4:

  soc: ti: wkup_m3_ipc: Remove redundant error printing in wkup_m3_ipc_probe() (2021-06-04 13:04:13 -0700)

----------------------------------------------------------------
SOC: Keystone driver update for v5.13

Couple of cleanup fixes in PM AVS and WKUP M3 drivers

----------------------------------------------------------------
Qiheng Lin (1):
      PM: AVS: remove redundant dev_err call in omap_sr_probe()

Zhen Lei (1):
      soc: ti: wkup_m3_ipc: Remove redundant error printing in wkup_m3_ipc_probe()

 drivers/soc/ti/smartreflex.c | 4 +---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
