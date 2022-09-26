Return-Path: <SRS0=kd9Q=Z5=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856CC32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 11:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42878C4347C; Mon, 26 Sep 2022 11:08:03 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13811C433D7
	for <soc@kernel.org>; Mon, 26 Sep 2022 11:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13811C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id s10so7014030ljp.5
        for <soc@kernel.org>; Mon, 26 Sep 2022 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Rtba/8ZlIVkRxeLWCcD3DntGviEHsU0OZhUgFoCj31I=;
        b=vPmVloGpyRYmat4PA6d+gB2v+5RY4EWTEhP/YUlx6cm+aJAsMRg1eR6GjDoHqxsdqv
         1YqNa/zb9zM2hXwulrB8ivy5SQRGnBS7pKFv6YBfDnyLZ1r525G1nv9kfhvA9fDPe9Mu
         YFA44CdVTtdbfS7V9eBD2THDBoD1ONN6N/ShnScDa6yRgCWBYK3AWPSWCHNxIWRc+lru
         uhnAel7ktjlWWXjdaFLLMXIoBIyJdC3OuD0NhPx+g424M+Myv91UnwLa0PYwEOr1IAZn
         ISbh1M8ubpLN5ar1NR8+GP10G0qmkqCpp/+8gUeWwQiMka5MmzdFO6SBENkuIbgFJxJe
         VwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Rtba/8ZlIVkRxeLWCcD3DntGviEHsU0OZhUgFoCj31I=;
        b=8Py6f8pyaTmwJ8REZM6R08tP6aGti6HA7Lvp9HxLQ4WoSuax2HJ3hscsU4WoglYZqL
         FZlRIh2fNCS9Ng72201bjLYNlUrYdxTnR1QPo4iUJk+LSC1bno+bgacqP43tWswLZ5u8
         SK/VVtaXHHWdaGrHR1qcnP7EY8BLoHiBaFrYldawi9cMGp9OiSLLWcmDfM/dLFZR2z7b
         S4DdOH3mkifPZUiv6mxJc0UlCcYkQFz4Hu9iXj2+2M/YnEyU/nRcmEmLMEfxi3LvLh73
         JTD0Fvv1BcVyiEF5ItExeNHj3dCYQeRra07XyXeJIsjRCvH8nnBkdxL9F/Gsql0clvKa
         C+kg==
X-Gm-Message-State: ACrzQf1/3kJnEzsSPxD853LizNqtb6ok3RwEEO8FO3Oe3oIchZcoaJG0
	sNOcV7td1ZV46VpDWrxg3JpbNw==
X-Google-Smtp-Source: AMsMyM6YBs5IdTpDYtGuCaX7wFsCohJTHQUM0kURNSBXbrX6SFK3DaigorrLC6WvrA3zBU2TRsHFiQ==
X-Received: by 2002:a05:651c:146:b0:26d:9eb6:7f35 with SMTP id c6-20020a05651c014600b0026d9eb67f35mr822745ljd.311.1664190480106;
        Mon, 26 Sep 2022 04:08:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b0048af4dc964asm2506587lfn.73.2022.09.26.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:07:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	linux-pm@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [RESEND PATCH v2] firmware/psci: Add debugfs support to ease debugging
Date: Mon, 26 Sep 2022 14:07:58 +0300
Message-Id: <20220926110758.666922-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To ease debugging of PSCI supported features, add debugfs file called
'psci' describing PSCI and SMC CC versions, enabled features and
options.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
I sketched this while trying to narrow down the particular issue on
the Qualcomm platform (which started as an attempt to implement PSCI
domains, but then led to understanding that while the platform claims
supports OSI, it doesn't support SET_SUSPEND). We were going to use
this to help to narrow down issues with the PSCI support on other
platforms as well.

Changes since v1:
- Extended the table to include MEM_PROTECT functions (noted by Mark
  Brown)
- Switched to seq_puts where possible
- Changed S_IRUGO to 0444

The patch is resent to include soc@kernel.org
---
 drivers/firmware/psci/psci.c | 116 ++++++++++++++++++++++++++++++++++-
 include/uapi/linux/psci.h    |  14 +++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index cfb448eabdaa..9fdcb6bff403 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/cpuidle.h>
+#include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
@@ -324,12 +325,125 @@ static void psci_sys_poweroff(void)
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
 }
 
-static int __init psci_features(u32 psci_func_id)
+static int psci_features(u32 psci_func_id)
 {
 	return invoke_psci_fn(PSCI_1_0_FN_PSCI_FEATURES,
 			      psci_func_id, 0, 0);
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+#define PSCI_ID(ver, _name) \
+	{ .fn = PSCI_##ver##_FN_##_name, .name = #_name, }
+#define PSCI_ID_NATIVE(ver, _name) \
+	{ .fn = PSCI_FN_NATIVE(ver, _name), .name = #_name, }
+
+/* A table of all optional functions */
+static const struct {
+	u32 fn;
+	const char *name;
+} psci_fn_ids[] = {
+	PSCI_ID_NATIVE(0_2, MIGRATE),
+	PSCI_ID(0_2, MIGRATE_INFO_TYPE),
+	PSCI_ID_NATIVE(0_2, MIGRATE_INFO_UP_CPU),
+	PSCI_ID(1_0, CPU_FREEZE),
+	PSCI_ID_NATIVE(1_0, CPU_DEFAULT_SUSPEND),
+	PSCI_ID_NATIVE(1_0, NODE_HW_STATE),
+	PSCI_ID_NATIVE(1_0, SYSTEM_SUSPEND),
+	PSCI_ID(1_0, SET_SUSPEND_MODE),
+	PSCI_ID_NATIVE(1_0, STAT_RESIDENCY),
+	PSCI_ID_NATIVE(1_0, STAT_COUNT),
+	PSCI_ID_NATIVE(1_1, SYSTEM_RESET2),
+	PSCI_ID(1_1, MEM_PROTECT),
+	PSCI_ID_NATIVE(1_1, MEM_PROTECT_CHECK_RANGE),
+};
+
+static int psci_debugfs_read(struct seq_file *s, void *data)
+{
+	int feature, type, i;
+	u32 ver;
+
+	ver = psci_ops.get_version();
+	seq_printf(s, "PSCIv%d.%d\n",
+		   PSCI_VERSION_MAJOR(ver),
+		   PSCI_VERSION_MINOR(ver));
+
+	/* PSCI_FEATURES is available only starting from 1.0 */
+	if (PSCI_VERSION_MAJOR(ver) < 1)
+		return 0;
+
+	feature = psci_features(ARM_SMCCC_VERSION_FUNC_ID);
+	if (feature != PSCI_RET_NOT_SUPPORTED) {
+		ver = invoke_psci_fn(ARM_SMCCC_VERSION_FUNC_ID, 0, 0, 0);
+		seq_printf(s, "SMC Calling Convention v%d.%d\n",
+			   PSCI_VERSION_MAJOR(ver),
+			   PSCI_VERSION_MINOR(ver));
+	} else {
+		seq_puts(s, "SMC Calling Convention v1.0 is assumed\n");
+	}
+
+	feature = psci_features(PSCI_FN_NATIVE(0_2, CPU_SUSPEND));
+	if (feature < 0) {
+		seq_printf(s, "PSCI_FEATURES(CPU_SUSPEND) error (%d)\n", feature);
+	} else {
+		seq_printf(s, "OSI is %ssupported\n",
+			   (feature & BIT(0)) ? "" : "not ");
+		seq_printf(s, "%s StateID format is used\n",
+			   (feature & BIT(1)) ? "Extended" : "Original");
+	}
+
+	type = psci_ops.migrate_info_type();
+	if (type == PSCI_0_2_TOS_UP_MIGRATE ||
+	    type == PSCI_0_2_TOS_UP_NO_MIGRATE) {
+		unsigned long cpuid;
+
+		seq_printf(s, "Trusted OS %smigrate capable\n",
+			   type == PSCI_0_2_TOS_UP_NO_MIGRATE ? "not " : "");
+		cpuid = psci_migrate_info_up_cpu();
+		seq_printf(s, "Trusted OS resident on physical CPU 0x%lx (#%d)\n",
+			   cpuid, resident_cpu);
+	} else if (type == PSCI_0_2_TOS_MP) {
+		seq_puts(s, "Trusted OS migration not required\n");
+	} else {
+		if (type != PSCI_RET_NOT_SUPPORTED)
+			seq_printf(s, "MIGRATE_INFO_TYPE returned unknown type (%d)\n", type);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(psci_fn_ids); i++) {
+		feature = psci_features(psci_fn_ids[i].fn);
+		if (feature == PSCI_RET_NOT_SUPPORTED)
+			continue;
+		if (feature < 0)
+			seq_printf(s, "PSCI_FEATURES(%s) error (%d)\n",
+				   psci_fn_ids[i].name, feature);
+		else
+			seq_printf(s, "%s is supported\n", psci_fn_ids[i].name);
+	}
+
+	return 0;
+}
+
+static int psci_debugfs_open(struct inode *inode, struct file *f)
+{
+	return single_open(f, psci_debugfs_read, NULL);
+}
+
+static const struct file_operations psci_debugfs_ops = {
+	.owner = THIS_MODULE,
+	.open = psci_debugfs_open,
+	.release = single_release,
+	.read = seq_read,
+	.llseek = seq_lseek
+};
+
+static int __init psci_debugfs_init(void)
+{
+	return PTR_ERR_OR_ZERO(debugfs_create_file("psci", 0444, NULL, NULL,
+						   &psci_debugfs_ops));
+}
+late_initcall(psci_debugfs_init)
+#endif
+
 #ifdef CONFIG_CPU_IDLE
 static int psci_suspend_finisher(unsigned long state)
 {
diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
index 2bf93c0d6354..3511095c2702 100644
--- a/include/uapi/linux/psci.h
+++ b/include/uapi/linux/psci.h
@@ -48,12 +48,26 @@
 #define PSCI_0_2_FN64_MIGRATE_INFO_UP_CPU	PSCI_0_2_FN64(7)
 
 #define PSCI_1_0_FN_PSCI_FEATURES		PSCI_0_2_FN(10)
+#define PSCI_1_0_FN_CPU_FREEZE			PSCI_0_2_FN(11)
+#define PSCI_1_0_FN_CPU_DEFAULT_SUSPEND		PSCI_0_2_FN(12)
+#define PSCI_1_0_FN_NODE_HW_STATE		PSCI_0_2_FN(13)
 #define PSCI_1_0_FN_SYSTEM_SUSPEND		PSCI_0_2_FN(14)
 #define PSCI_1_0_FN_SET_SUSPEND_MODE		PSCI_0_2_FN(15)
+#define PSCI_1_0_FN_STAT_RESIDENCY		PSCI_0_2_FN(16)
+#define PSCI_1_0_FN_STAT_COUNT			PSCI_0_2_FN(17)
+
 #define PSCI_1_1_FN_SYSTEM_RESET2		PSCI_0_2_FN(18)
+#define PSCI_1_1_FN_MEM_PROTECT			PSCI_0_2_FN(19)
+#define PSCI_1_1_FN_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN(19)
 
+#define PSCI_1_0_FN64_CPU_DEFAULT_SUSPEND	PSCI_0_2_FN64(12)
+#define PSCI_1_0_FN64_NODE_HW_STATE		PSCI_0_2_FN64(13)
 #define PSCI_1_0_FN64_SYSTEM_SUSPEND		PSCI_0_2_FN64(14)
+#define PSCI_1_0_FN64_STAT_RESIDENCY		PSCI_0_2_FN64(16)
+#define PSCI_1_0_FN64_STAT_COUNT		PSCI_0_2_FN64(17)
+
 #define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
+#define PSCI_1_1_FN64_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN64(19)
 
 /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
 #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
-- 
2.35.1

