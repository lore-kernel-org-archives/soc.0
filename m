Return-Path: <SRS0=uZ+G=BT=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E89C7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 11:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66088C4339E; Tue, 30 May 2023 11:29:54 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAA62C433D2;
	Tue, 30 May 2023 11:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CAA62C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QVqrn0N2qzFqWy;
	Tue, 30 May 2023 19:28:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 19:29:43 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>, <liuyonglong@huawei.com>,
	<lihuisong@huawei.com>
Subject: [PATCH v3 2/2] doc: soc: hisilicon: Add Kunpeng HCCS driver documentation
Date: Tue, 30 May 2023 19:27:46 +0800
Message-ID: <20230530112746.2767-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230530112746.2767-1-lihuisong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230530112746.2767-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Document the sysfs attributes description provided by HCCS driver on
Kunpeng SoC.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 .../sysfs-devices-platform-kunpeng_hccs       | 76 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
new file mode 100644
index 000000000000..a9b5c5b0a997
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
@@ -0,0 +1,76 @@
+What:		/sys/devices/platform/HISI04Bx:00/chipX/all_linked
+		/sys/devices/platform/HISI04Bx:00/chipX/linked_full_lane
+		/sys/devices/platform/HISI04Bx:00/chipX/crc_err_cnt
+Date:		May 2023
+KernelVersion:	6.4
+Contact:	Huisong Li <lihuisong@huawei.org>
+Description:
+		The /sys/devices/platform/HISI04Bx:00/chipX/ directory
+		contains read-only attributes exposing some summarization
+		information of all HCCS ports under a specified chip.
+		The X in 'chipX' indicates the Xth chip on platform.
+
+		There are following attributes in this directory:
+		================= ==== =========================================
+		all_linked:       (RO) if all enabled ports on this chip are
+				       linked (bool).
+		linked_full_lane: (RO) if all linked ports on this chip are full
+				       lane (bool).
+		crc_err_cnt:      (RO) total CRC err count for all ports on this
+				       chip.
+		============= ==== =============================================
+
+What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/all_linked
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/linked_full_lane
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/crc_err_cnt
+Date:		May 2023
+KernelVersion:	6.4
+Contact:	Huisong Li <lihuisong@huawei.org>
+Description:
+		The /sys/devices/platform/HISI04Bx:00/chipX/dieY/ directory
+		contains read-only attributes exposing some summarization
+		information of all HCCS ports under a specified die.
+		The Y in 'dieY' indicates the hardware id of the die on chip who
+		has chip id X.
+
+		There are following attributes in this directory:
+		================= ==== =========================================
+		all_linked:       (RO) if all enabled ports on this die are
+				       linked (bool).
+		linked_full_lane: (RO) if all linked ports on this die are full
+				       lane (bool).
+		crc_err_cnt:      (RO) total CRC err count for all ports on this
+				       die.
+		============= ==== =============================================
+
+What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/type
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mode
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/enable
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/cur_lane_num
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mask
+		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/crc_err_cnt
+Date:		May 2023
+KernelVersion:	6.4
+Contact:	Huisong Li <lihuisong@huawei.org>
+Description:
+		The /sys/devices/platform/HISI04Bx/chipX/dieX/hccsN/ directory
+		contains read-only attributes exposing information about
+		a HCCS port. The N value in 'hccsN' indicates this port id.
+		The X in 'chipX' indicates the ID of the chip to which the
+		HCCS port belongs. For example, X ranges from to 'n - 1' if the
+		chip number on platform is n.
+		The Y in 'dieY' indicates the hardware id of the die to which
+		the hccs port belongs.
+
+		The HCCS port have the following attributes:
+		============= ==== =============================================
+		type:         (RO) port type (string), e.g. HCCS-v1 -> H32
+		lane_mode:    (RO) the lane mode of this port (string), e.g. x8
+		enable:       (RO) indicate if this port is enabled (bool).
+		cur_lane_num: (RO) current lane number of this port.
+		lane_mask:    (RO) current lane mask of this port, every bit
+			           indicates a lane.
+		crc_err_cnt:  (RO) CRC err count on this port.
+		============= ==== =============================================
+		Note: type, lane_mode and enable are fixed attributes on
+		      running platform.
diff --git a/MAINTAINERS b/MAINTAINERS
index e08aa0d5c491..1da0daece29a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9433,6 +9433,7 @@ F:	drivers/crypto/hisilicon/zip/
 HISILICON KUNPENG SOC HCCS DRIVER
 M:	Huisong Li <lihuisong@huawei.com>
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 F:	drivers/soc/hisilicon/kunpeng_hccs.c
 F:	drivers/soc/hisilicon/kunpeng_hccs.h
 
-- 
2.33.0

