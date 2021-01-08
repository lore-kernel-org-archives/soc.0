Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70923C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82F22395C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82F22395C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbjRTSnNTBQ0fv53PpMlcoqcpPanDJh0P6x6P1cNcH8=; b=MV+MoBGzIPwTpBIYYSpW+66wO
	YjMxRdrQf9NmqfokmdyGKFXVVVjhJ6FFfAOb0ORUCZEcaSgu1ctRolgXQsMdCYVTuLUOGm6yNxkVa
	11fZ669Jfa0ukE40Wff351rSkHfv8IyxBFfoUrIkKoE9ZiI7oFfEUwloIe0xiCZXjN5R3pdyvFaQC
	LqeLVGuEY84RGGFrbILgVEmx22WgDAeR+brKBLVTz1Upr78hjnvqbwcAJQdGb/on/0qOFv3q3sdqB
	691rJcFrEtQCKI1RZz29mT0sMQqERmk9neCKGHrqENMnQIBMMlYl/xUfgx18stDp21w9ymbZXqgz2
	huvdgZD8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpE3-00036q-TB; Fri, 08 Jan 2021 10:42:35 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpCB-0002o5-5c
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:40:43 +0000
IronPort-SDR: oI3uXa0+vdqIhgHZ2bsOiXvw/bnTFEyIPrybQAeTUzDZ1ehHCU/I6KBeCwDhXfWHGQfsbHeGgn
 FhR1VwoWL+o5ni84VtJgGoSATgOMB/0yZOZmJYcIJV69xcK2mwYrFAB4XiAzBrvzCA511k6qmW
 a/b65VfnACIPzndA5kGGv/c9lj9qIWJR8uNmEu1U+5jKGAaAbO1PFxiQQUrea2VQIuhzOiWQzA
 pdEA5uSVQigSNFrlEyQa8Q3yG6I0crgIcUCVW7U/zWZvcn0a73kZtM1MASEGQm+KWC52LuJH2R
 pSQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14147249"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14147249"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa2.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com
 [192.168.87.58])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6253132F7C2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
 (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
 by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B035F22F3C3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
 (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
 by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id B82DC692763;
 Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:32 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 07/10] soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
Date: Fri, 8 Jan 2021 19:52:38 +0900
Message-ID: <20210108105241.1757799-8-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_054039_420922_044FFAB4 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 misono.tomohiro@jp.fujitsu.com, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108105238.I0rQYWtSk-XX0tu9Fndv3LUf6x7qYZHlKjm8edtf0o4@z>

This is an infomative ioctl to tell users CMG/PE number of currently
running PE.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 18 ++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 2535942cc0d7..1132cb74b13b 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -733,6 +733,21 @@ static int ioc_bb_free(struct file *filp,  void __user *argp)
 	return 0;
 }
 
+static int ioc_get_pe_info(struct file *filp, void __user *argp)
+{
+	struct fujitsu_hwb_ioc_pe_info pe_info = {0};
+	int cpu = smp_processor_id();
+
+	pe_info.cmg = _hwinfo.core_map[cpu].cmg;
+	pe_info.ppe = _hwinfo.core_map[cpu].ppe;
+
+	if (copy_to_user((struct fujitsu_hwb_ioc_pe_info __user *)argp, &pe_info,
+						sizeof(struct fujitsu_hwb_ioc_pe_info)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -751,6 +766,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BB_FREE:
 		ret = ioc_bb_free(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_GET_PE_INFO:
+		ret = ioc_get_pe_info(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index 7a285d8db0a9..1226014d97c4 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -22,6 +22,11 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	__s8 window;
 };
 
+struct fujitsu_hwb_ioc_pe_info {
+	__u8 cmg;
+	__u8 ppe;
+};
+
 #define FUJITSU_HWB_IOC_BB_ALLOC _IOWR(__FUJITSU_IOCTL_MAGIC, \
 	0x00, struct fujitsu_hwb_ioc_bb_ctl)
 #define FUJITSU_HWB_IOC_BW_ASSIGN _IOWR(__FUJITSU_IOCTL_MAGIC, \
@@ -30,5 +35,7 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	0x02, struct fujitsu_hwb_ioc_bw_ctl)
 #define FUJITSU_HWB_IOC_BB_FREE _IOW(__FUJITSU_IOCTL_MAGIC, \
 	0x03, struct fujitsu_hwb_ioc_bb_ctl)
+#define FUJITSU_HWB_IOC_GET_PE_INFO _IOR(__FUJITSU_IOCTL_MAGIC, \
+	0x04, struct fujitsu_hwb_ioc_pe_info)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
