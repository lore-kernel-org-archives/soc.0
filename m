Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394D3FE34F
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488651; cv=none; b=VOKI5Zq6IuCjQCmiU6G3HGueGw7Xy2iwJBF1GYpEW07ue3RXSOpI8TdrD31wRSLJus/J1riadKo08SO0nPxpd4CnzYc9S1q3S0EPRDzkzxC3X9/ZkJBitmLfOH6DcNi9zDrKxBgGAiS85llUyEo9vGVUuoOZIjZdkYP91PSJFYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488651; c=relaxed/simple;
	bh=NJks1vkDkfEmwQezyTOQvG4CbAf8E+uRI1mOQW7+lE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOXtXpcjVqq4yv56i3zAXNmB07F2uNSqSxx1z7QqodE8OnOGYXMz+F4KdlYROpr8F7+K+TxElTmpxntx0kz0SllD1xzBvPnsIV4ikRX1LreksQWEDexVk1M7fmhEcqHLc0Xs4C4w9dh14FjOQe3HJ6NXCYskosqnKBR8cjmyl3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKAA2D8v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMHXi6sS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKAA2D8v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMHXi6sS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEs8Rf1721239
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=; b=dKAA2D8vcWcwlALA
	Mj/UhTkYUh9m2Kx8HFPFUJ9c9PVj0SQVbmlEVhOkUSSCS3OX507gQoFhSBTELDMH
	lQPeNxhyzYj/xxLK19PxiCtyo8BJYpI0/ljNjgMxlxYpYp4wt7hHMctFZCfcCsLE
	99t48JCjqgOIWqzEdQLDzrC3md39vURUuvdo1GvV/XoRwoHS59TiW7WiB2Luc0fq
	4Ix+9vydrM2fp3ZloRfE0nwyfiPdyK2MdWHltWQd6V5Lvj/LhM+S0rBrJvTP8Lqu
	WIovxW12s1LJ+pOwuwDF36zaykaErtSqxm7fg92czwPFYtXMc6MJLO9sIKD+udbV
	hOw54Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua733jf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so960251cf.1
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488643; x=1778093443; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=;
        b=NMHXi6sSeqA4GM9eYy8ZUoxL27oc2PwSICcCUnZiLZioCz1Tgc/NJ2EYDjAJgfc0/I
         UgIL7VS1CF0uS65SGH/P//APQXKg5J4WgstrfLUUZf3/pz/8dPcYOiNu75W38yLy4Ent
         7TmBVoLxAIUBsih3yZyBwHtLuL8agl0yMVa4hFuA7zeMfBntOdxz4BJtRD4jiv7sNCbe
         wWHq0KdqmrCRluE18jgyRXu+vWykYUX+LxhWO5qm7T7NLu40XRrH+6DZIsMuZDwESjdH
         LBXKUTC/fc8uIvlFcX4RajEtTm/zgeFZ3pE0BLeJY9K3bFJtp3TBkZ9c2IAUrAOrwYjP
         66AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488643; x=1778093443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=;
        b=jhRXvLzFWpQ6jnEmPcXWUQQHKKmv3kZNY+aaPIfMlKFP+yMCpvqSVUwaBSgQcueN04
         LpdytE48jNV/7wDj4M/jhDvfAn/fH/aSjn7FblWA/G8KDXZbZm32qG1DZks/x0MfNlxZ
         1l41C4kcE+f0tL7WdzzWtesu3lS4UTjBZ8yeTgzgKB4xiBjpFFbRT6PgoyWmvzyhRI47
         PawKX5hSbvAO3a3ZBYDyuPjLxcgh7/wr513rVRqP/JOPYHSdWjle3FP0qt0VNCk5h9hv
         3Xob7m0rW8vr0rpKcLAAZM478XcEMLMaYOPFzwkTrII1yo62T1VLv+oGhGqj/+fdKv71
         7ZJg==
X-Forwarded-Encrypted: i=1; AFNElJ+gNMs9de9vi76k65t0CErh/ug8NX03OT28gMmD00G6OCmdoHRjEj3mWIv5iWHDSWKwxnw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0VWoepaTd6z5KpaM2tAa/fBrD16cAHtktW94HgHrvteMEurHI
	qgpsDVEdcczkqdURFl6V9D0uMZxmqXm1d2BxdRjxVusTM+ldgrTZOrLAtpuWyZd9TEVc9pxPDFd
	Ivg79nVA0LlPYsZ5NQxBv2UaHvu0sN75oNmB45e/8HljF7IFRfA5R7wY=
X-Gm-Gg: AeBDiesqNMje2GfHgXpq86vpZV5Ohz0jNkyMOXoNGGI5nuSP2bRmOG+ghLDeFGx6Hvc
	NnyAW5nsnUF9IrJURpdc04zBCZkAtzh2AVgupBk1hl1abby9ctf9/9qNiAf8yOFaLDKyRcmug5A
	ldvaJnlwk+WGyQ2eBLV7g6eyUT/o9thCzvdbbACkFZPQ2V65V9iC99sgseRmWgLCNdFh2iPX4P1
	45ZRLoxHjF7EH0sYUyuMrr2zlybO1idCsO8Dh/JuE/KaJnBHVuBBldn2MiEESCeugC8X2VL3QPK
	9Jo5rM0jF4vbJV8J+4VnIvi1yKgFY2jIwdmDE4B1tI1yUaWUhCx/thpRHn1Sd9JgYw27SxxoS+S
	aaouXMC7GLqNNPSXMAO6XD2Zv3wMMOJLbjMuQSUfoIQfVu74hK2Bp9Tc=
X-Received: by 2002:a05:622a:5c8c:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5100e101d64mr123609041cf.4.1777488643292;
        Wed, 29 Apr 2026 11:50:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8c:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5100e101d64mr123608531cf.4.1777488642783;
        Wed, 29 Apr 2026 11:50:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:26 +0200
Subject: [PATCH v2 5/5] arm64: defconfig: Switch Ethernet drivers to
 modules
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5969;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJks1vkDkfEmwQezyTOQvG4CbAf8E+uRI1mOQW7+lE0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL2gh106Xq3K/+8QkjuXEU8MKngkgpmhndxM
 i+f+zPIdBmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9gAKCRDBN2bmhouD
 1yrYD/9Tx0OP4MDw239AKtaoPwcSBLIQGJnAqVUjRAQaNZbaUmm5DQwnGCsCloTDwfmmNwn5NEe
 DDPwWkVqx/0RAHFHQ3SQARd5av9huqIbazMUYjoHui7HDi6QNbz5sGOFyvXngitVLGQapQng/bv
 0SB7zoNp93plDSQdom1OsF1jF5P5jclEH335PuoBDsLjQJgmPZLAgAb75GIEDOCOV74rFQcnlHf
 F9Klgx7A24pGXYn+xhC2xbHyfsiiFDlG7hk1K8zQRVhBjrfViext9KLnoztXVO6NvE/bsbA/94r
 0DcLSlEfAPQOLYVqxIJYFcgSHAIhIwJGBQTXVO7tCKqPfjaqEO64nSn6X+V91eQ8ZDabEaRQDVP
 3zbtPWmJoO6dnQt11y7iJ69i+th8dFw0AM2wcjrgjGEhRNpYzZJF27pWq/Qz+sC2dckr9J3Xbw1
 dxlTAloUVnZaXPpke8vCIWMjaNlM3OYRpo1JTOJMXViRZr8IBshC7ii+BAzZnuJSDKEsBBss7i8
 A7kJhZKcjSwiWZqIMMwCjTqw8F7cHMywWTzvq1cN2lNfNwsnov7CCZTgun2a3jotZiLCy2f7C+m
 8G1zmQ0Ipov2yVdwxjRvPuOoUjBz8vDVlpA+BwFtuHOBf8ecQTH0QYh244k5lVTyiA92QbzuMa9
 /ziFdSZmDIp8lBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f25304 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uZThdQlqimpIaNIbivEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfXyXuuOgPrxOiw
 QZtaVi2Hh/7CliytqyPfyFKSZxVnr9AwAXZ1tkOe2nbtx/sUArIbBFg1KzFlE0WU1OziPz98dHI
 R0UJ+cgRbwfmL7PJVBkLa9OyTdQNJdccmrKTuJEuEzuulpWykjWbEx7mLqEqmiiFGTN0xITmHvm
 dUzCZOiReYjmz7KbRrmwhdaqL/2AIV4Ivd9V3NeBSWuF4SpD4p1mN2NbJPUFn0wcnmQHnxJHjll
 oLjs7F0JLOMZbs/GKQFPUwmhPpILivcjL2ZxQJEJlcE5kaudkTHpPkWQE22faNq4V4zkQdF3tlY
 AV9vBQTaxb+J/kR3vugT++bjOpTlj6bHgi1r97f/YDmd9HteQV/6fHqOMKe//gbtP6E3y4tevtN
 IX+rEZjys2pQf9Raw6TMvnpfDvoEAMA8I9UlVfsSGvMFabZWwzQJhp/HZb1v12sVJPC58SJ/Ud7
 7a5Wpygo0oqLNvgD4tw==
X-Proofpoint-GUID: sjN43I2gXK8ifTHdE_yT03EZiluKrTsQ
X-Proofpoint-ORIG-GUID: sjN43I2gXK8ifTHdE_yT03EZiluKrTsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290188

Development of Linux kernel progressed over last 10 years and it is easy
to generate now initramfs for building own kernel, e.g. with Yocto or
mkosi.  Therefore for a few years of reviews on mailing lists, all new
options enabled in arm64 defconfig were with assumption of having
initramfs which can load bare minimum of modules to mount filesystem
from network or disk.  Basically network driver as built-in is not
anymore essential to boot the system, so switch almost all Ethernet
drivers to modules to save on kernel image size.

Similarly 9P network filesystem for QEMU, especially that testing kernel
unuder QEMU does not have any size or build process constraints and can
use initramfs with -initrd argument.  Note that having network drivers
does not break NFS root, because whatever loading method, e.g. TFTP,
which brought the kernel image can bring also the initramfs with network
adapters (and I have been using such method for years for my Samsung
boards).

Notable exceptions / diff explanations:

1. Mark I2C as built-in, used by CONFIG_IGB as a module.

2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
   they were default=y (via ARCH_BCMBCA or ARCH_BCM_IPROC).

3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
   default=m.

Moving code to modules has positive impact on kernel image size, thus
boot time of all users not using above drivers and ability to flash
fixed-size boot partitions.

Old Image size: 41.2 MiB (Image.gz: 14.8 MiB)
New Image size: 39.1 MiB (Image.gz: 13.8 MiB)

bloat-o-meter of vmlinux:
add/remove: 3/6972 grow/shrink: 6/45 up/down: 66659/-2333659 (-2267000)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 72 +++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 79f6294fffdf..f373549a7c12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -199,8 +199,8 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_RFKILL_GPIO=m
-CONFIG_NET_9P=y
-CONFIG_NET_9P_VIRTIO=y
+CONFIG_NET_9P=m
+CONFIG_NET_9P_VIRTIO=m
 CONFIG_NFC=m
 CONFIG_NFC_NCI=m
 CONFIG_NFC_NXP_NCI=m
@@ -356,17 +356,20 @@ CONFIG_NET_DSA_MSCC_FELIX=m
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
-CONFIG_AMD_XGBE=y
+CONFIG_AMD_XGBE=m
 CONFIG_NET_XGENE=y
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
+CONFIG_BCM4908_ENET=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
+CONFIG_BGMAC_PLATFORM=m
 CONFIG_SYSTEMPORT=m
-CONFIG_MACB=y
-CONFIG_THUNDER_NIC_PF=y
+CONFIG_BCMASP=m
+CONFIG_MACB=m
+CONFIG_THUNDER_NIC_PF=m
 # CONFIG_NET_VENDOR_CHELSIO is not set
 # CONFIG_NET_VENDOR_CISCO is not set
 # CONFIG_NET_VENDOR_CORTINA is not set
@@ -376,33 +379,31 @@ CONFIG_THUNDER_NIC_PF=y
 # CONFIG_NET_VENDOR_EMULEX is not set
 # CONFIG_NET_VENDOR_ENGLEDER is not set
 # CONFIG_NET_VENDOR_EZCHIP is not set
-CONFIG_FEC=y
-CONFIG_FSL_FMAN=y
-CONFIG_FSL_DPAA_ETH=y
-CONFIG_FSL_DPAA2_ETH=y
-CONFIG_FSL_ENETC=y
+CONFIG_FEC=m
+CONFIG_FSL_FMAN=m
+CONFIG_FSL_DPAA_ETH=m
+CONFIG_FSL_DPAA2_ETH=m
+CONFIG_FSL_ENETC=m
 CONFIG_NXP_ENETC4=m
-CONFIG_FSL_ENETC_VF=y
+CONFIG_FSL_ENETC_VF=m
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
 # CONFIG_NET_VENDOR_FUNGIBLE is not set
 # CONFIG_NET_VENDOR_GOOGLE is not set
-CONFIG_HIX5HD2_GMAC=y
-CONFIG_HNS_DSAF=y
-CONFIG_HNS_ENET=y
-CONFIG_HNS3=y
-CONFIG_HNS3_HCLGE=y
-CONFIG_HNS3_ENET=y
+CONFIG_HIX5HD2_GMAC=m
+CONFIG_HNS_DSAF=m
+CONFIG_HNS_ENET=m
+CONFIG_HNS3=m
 # CONFIG_NET_VENDOR_HUAWEI is not set
-CONFIG_E1000=y
-CONFIG_E1000E=y
-CONFIG_IGB=y
-CONFIG_IGBVF=y
+CONFIG_E1000=m
+CONFIG_E1000E=m
+CONFIG_IGB=m
+CONFIG_IGBVF=m
 # CONFIG_NET_VENDOR_ADI is not set
 # CONFIG_NET_VENDOR_LITEX is not set
-CONFIG_MVNETA=y
-CONFIG_MVPP2=y
-CONFIG_SKY2=y
+CONFIG_MVNETA=m
+CONFIG_MVPP2=m
+CONFIG_SKY2=m
 CONFIG_NET_VENDOR_MEDIATEK=y
 CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
@@ -426,27 +427,27 @@ CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
 # CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
-CONFIG_SH_ETH=y
-CONFIG_RAVB=y
-CONFIG_RENESAS_ETHER_SWITCH=y
-CONFIG_RTSN=y
+CONFIG_SH_ETH=m
+CONFIG_RAVB=m
+CONFIG_RENESAS_ETHER_SWITCH=m
+CONFIG_RTSN=m
 # CONFIG_NET_VENDOR_ROCKER is not set
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
 # CONFIG_NET_VENDOR_SOLARFLARE is not set
-CONFIG_SMC91X=y
-CONFIG_SMSC911X=y
-CONFIG_SNI_AVE=y
-CONFIG_SNI_NETSEC=y
+CONFIG_SMC91X=m
+CONFIG_SMSC911X=m
+CONFIG_SNI_AVE=m
+CONFIG_SNI_NETSEC=m
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 # CONFIG_NET_VENDOR_SUN is not set
 # CONFIG_NET_VENDOR_SYNOPSYS is not set
 # CONFIG_NET_VENDOR_TEHUTI is not set
-CONFIG_TI_K3_AM65_CPSW_NUSS=y
+CONFIG_TI_K3_AM65_CPSW_NUSS=m
 CONFIG_TI_ICSSG_PRUETH=m
 # CONFIG_NET_VENDOR_VERTEXCOM is not set
 # CONFIG_NET_VENDOR_VIA is not set
@@ -479,7 +480,7 @@ CONFIG_CAN_M_CAN_PLATFORM=m
 CONFIG_CAN_RCAR=m
 CONFIG_CAN_RCAR_CANFD=m
 CONFIG_CAN_MCP251XFD=m
-CONFIG_MDIO_GPIO=y
+CONFIG_MDIO_GPIO=m
 CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_USB_PEGASUS=m
@@ -601,6 +602,7 @@ CONFIG_TCG_TIS_SPI=m
 CONFIG_TCG_TIS_SPI_CR50=y
 CONFIG_TCG_TIS_I2C_CR50=m
 CONFIG_TCG_TIS_I2C_INFINEON=y
+CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
@@ -1955,7 +1957,7 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-CONFIG_9P_FS=y
+CONFIG_9P_FS=m
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y

-- 
2.51.0

