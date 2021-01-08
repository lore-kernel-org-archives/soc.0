Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A9CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AE223770
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0AE223770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bqKIYZB9eYNc6/HfYzEOgaRP6sWUipeYiqz9hSUxcJs=; b=yC4wKY8/exFdurnszVG+pq9X2
	3IjZ96p/rPBNXqsgIc1ZdhzXGIPU79byov9VMx3cU0UEnESdPtYG7KN7FUZYDhRz+7B6bO2fkgj18
	HaVPJcjuf33uQAYQnbZlCJZirEQPwtkectozRmICWiAHn9gMqMAjGI6PkTkqjKotK4ryc4JMNVj4v
	wyV6vuZuLdlF12q1F481EYQc+bABqFifgnyXA95CkNNuGTkmJgj7UtbwGQ7KCM5iDjTXIveAIVkmm
	mt5lWTmDmKZHKkW00uDSv+BmM1bh6y1GNrO7EAsyW9uVTDLkxSJCrzZ2QYByUJMyUw53zWkCKfdmr
	2AcqzA9Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxowc-0005ro-4L; Fri, 08 Jan 2021 10:24:34 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosr-0004xl-6x
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:42 +0000
IronPort-SDR: NvWyPxBJqLNlq82me+1S8PboF6d454VOwa7e7zg7F/I5UpR2CPkB+uxEplS1WfosSlzuFrrAFJ
 to+DIuqyJdGtFVcqm4woKFOEwLG6Rr4cc3sqIdwt77LKHf85mrsBpLd/Xay2FyvQCUR7lpUdSE
 R6s46BBTCE799eXBiWQfQjLhCM4YBE+TOzSeQ4fm4wD40Vccc1jnqSIxfDZw2FNNkr3ERqnvQb
 /JksefSgXUntJ8nYSa8K0OT1MhelPLvYrnGE8Lk7oAVpToE4HRKnoETFVJ9PoQbD0w3nmhgHP4
 iDs=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14207574"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14207574"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A4DC1F50C4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
 (g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA8475AEED2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id E1ACB6D68B2;
 Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:28 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 05/10] soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
Date: Fri, 8 Jan 2021 19:32:22 +0900
Message-ID: <20210108103227.1740865-6-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052041_523225_84B8F2B3 
X-CRM114-Status: GOOD (  15.61  )
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
Message-ID: <20210108103222.ORYCdw9ZfO_qqEJ_7VEGHS6KvblB9eTnrGex0iyObhQ@z>

IOC_BW_UNASSIGN resets what IOC_BW_ASSIGN did on each PE.
This ioctl will also be called as many times as the number of PEs joining
synchronization.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 93 ++++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 85ffc1642dd9..8c4cabd60872 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -531,6 +531,96 @@ static int ioc_bw_assign(struct file *filp, void __user *argp)
 	return ret;
 }
 
+static int is_bw_unassignable(struct bb_info *bb_info, int cpu)
+{
+	u8 ppe;
+
+	if (!cpumask_test_and_clear_cpu(cpu, bb_info->assigned_pemask)) {
+		pr_err("This pe is not assigned: %u/%u/%d\n", bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	ppe = _hwinfo.core_map[cpu].ppe;
+	if (!test_bit(bb_info->bw[ppe], &_hwinfo.used_bw_bmap[cpu])) {
+		/* should not happen */
+		pr_crit("Logic error. This window is not assigned: %u/%u/%d\n",
+							bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void teardown_ctl_reg(struct bb_info *bb_info, int cpu)
+{
+	if (_hwinfo.used_bw_bmap[cpu] != 0)
+		/* Other window on this PE is still in use. Nothing todo */
+		return;
+
+	/*
+	 * This is the last unassign on this PE.
+	 * Clear all bits to disallow access to BST_SYNC/LBSY_SYNC from EL0
+	 */
+	write_sysreg_s(0, FHWB_CTRL_EL1);
+
+	pr_debug("Teardown ctl reg. cpu: %d\n", cpu);
+}
+
+static void teardown_bw(struct bb_info *bb_info, int cpu)
+{
+	u8 window;
+	u8 ppe;
+
+	/* Just clear all bits */
+	ppe = _hwinfo.core_map[cpu].ppe;
+	window = bb_info->bw[ppe];
+	write_bw_reg(window, 0);
+
+	/* Update bitmap info */
+	clear_bit(window, &_hwinfo.used_bw_bmap[cpu]);
+	bb_info->bw[ppe] = -1;
+
+	pr_debug("Teardown bw. cpu: %d, window: %u, BB: %u, bw_bmap: %lx, assigned_pemask: %*pbl\n",
+			cpu, window, bb_info->bb,
+			_hwinfo.used_bw_bmap[cpu], cpumask_pr_args(bb_info->assigned_pemask));
+}
+
+static int ioc_bw_unassign(struct file *filp, void __user *argp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct fujitsu_hwb_ioc_bw_ctl bw_ctl;
+	struct bb_info *bb_info;
+	int cpu;
+	int ret;
+	u8 cmg;
+
+	if (!is_bound_only_one_pe())
+		return -EPERM;
+
+	if (copy_from_user(&bw_ctl, (struct fujitsu_hwb_ioc_bw_ctl __user *)argp,
+						sizeof(struct fujitsu_hwb_ioc_bw_ctl)))
+		return -EFAULT;
+
+	cpu = smp_processor_id();
+	cmg = _hwinfo.core_map[cpu].cmg;
+	bb_info = get_bb_info(pdata, cmg, bw_ctl.bb);
+	if (IS_ERR(bb_info))
+		return PTR_ERR(bb_info);
+
+	/* See comments in ioc_bw_assign() */
+	preempt_disable();
+	ret = is_bw_unassignable(bb_info, cpu);
+	if (!ret) {
+		teardown_bw(bb_info, cpu);
+		teardown_ctl_reg(bb_info, cpu);
+	}
+	preempt_enable();
+
+	put_bb_info(bb_info);
+
+	return ret;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -543,6 +633,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BW_ASSIGN:
 		ret = ioc_bw_assign(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_BW_UNASSIGN:
+		ret = ioc_bw_unassign(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index ad90f8f3ae9a..396029f2bc0d 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -26,5 +26,7 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	0x00, struct fujitsu_hwb_ioc_bb_ctl)
 #define FUJITSU_HWB_IOC_BW_ASSIGN _IOWR(__FUJITSU_IOCTL_MAGIC, \
 	0x01, struct fujitsu_hwb_ioc_bw_ctl)
+#define FUJITSU_HWB_IOC_BW_UNASSIGN _IOW(__FUJITSU_IOCTL_MAGIC, \
+	0x02, struct fujitsu_hwb_ioc_bw_ctl)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
