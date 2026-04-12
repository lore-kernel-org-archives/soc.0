Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587932DA76C
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010900; cv=none; b=JtoWdknEcG0uqlKGcGI1N30+W5U13NzHy0obyXtyInJ7Vk1s/7NbPenjZ8tlK2QhLbMx88t3IxBiOARcbnTnY0+82BVxdvOQUYtPWUO3qQmTtRXojlw7rUjYyw4RPei+B52VjjYduMblNGw8gw38n2zeycnf2NQrn0qaRZUQ/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010900; c=relaxed/simple;
	bh=6hjUMCUeW/jKtCLOjUKJmC9SA5p+CIWzsfQo2ryaNME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHs8uC1IRaEhd+1rQ8hyuFhE+g0TULVBmG3XGdQfAq3IO4ytSKM5Bbu0WM/eO/iD1tOmYjTP7PriBCt3rSmhZAoaFJwRAVzviRJ4UoI/tNI2/7ReMNceTRWFZxbxbQ9aUKpyPsmsetzLhPoCmQePd0iZHh+5KCVRjh9BT4ybFkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4KU+dae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAx6AoTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4KU+dae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAx6AoTY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4gjE439830
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=; b=H4KU+daeGzXZZh1O
	GWGmu4z2nIKMwUCQPnADCgoz/rI1ByrhQz4IqqHnoLHNLwSm+ZI7oKTGJ8OLZ8r5
	FhvzHovjc3MfF677n7a1uUM/sNspu/J6gxhCy9dQSN2YvyVQY0X3XJYVELSyYDVQ
	OD4KmpjwfG2S9DZ8yl16XChg7KkHJBlTYFBlNf7TI35mFEdEMhSY7Mq05xDAlWp+
	Iye+vwXgkWmhDz6x5PUwJz8uy5MUZ20MtA64aptE7HzaXp9iXC8uSysyeOJjM5ku
	KB8IXU9AqPpvxGUTiJQeksWrpGiKxaYdbwWxDzYOfzU/v2MSYJZwIQwxUsSgQXul
	BPwopw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtjnh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so69265621cf.2
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010897; x=1776615697; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=;
        b=ZAx6AoTYf7f5wHRLBewrRJUh/R13xK+9aF+cMIVP2A4aT7lZTfA/lP3nkPPV7vPcRS
         ZdO2hkqTvBl0CrVG8bWY9S3HQbLNxAkfIiP9ii3KRRN+NPNWr+HCFiGUPPqycI9Uvq8m
         FnJLRmRKnzOUSyZqDPGXet8WD7msI2BdQSinkqisUAaXQTLbIEnSqyHpeNS4THdXLXAR
         6eu1xB9/fyNk1T74byWVCKaWrlFQr6eNf7qo80Fjsagb8GEKyvHwQio2mJQzsEh3RzGm
         ACtawzcuWnxKNOFtHw8rqIiUplZh3KBtGraRXoPymDxX7pTj8JEY+R1qJX59TUcSVSrQ
         hzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010897; x=1776615697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=;
        b=DjKcxxVOvY5lPoJBZ1hCxhqL4M3QkPEObT23/LvKnZ+4ht1K+XzuBvFdEhAe64FW7c
         3+1riyRLYlR5/edY166C7NBReIeN9DN5hEmxyKoPjXsCbG9zPRKwUdFdzQ8s8srM00ls
         jASgYbu2ches3YjrdLUZh8hBX5kIEfmJcc7MdR4Memjisper8bRkNZb5eOvQjwzHJJi/
         UcVqdB+nEPrSwCHY3kUMdfDH9Ltv7HsKdITad64zER7QF/C254HMSdrkPNkx24LEr0nA
         H8QEFtEaLxhst0EJRoozcTIwGI892q+boL0lkSJ7IFlGNA2z56q3KsbHkiWwStxg7mLx
         4Org==
X-Forwarded-Encrypted: i=1; AJvYcCVX58pvIy4uHYVdh0tomWHg56MpOX87vTfpMqwypM70/GpFTEuLrShtPZLqZKOzS5xXmU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDkPjxkw9SRUjLItdyWM2L/dq2J8VrWzeeXagIy/VQNdYYfgp6
	mKCVdSZ6E1jCer6beljLZJDqmPopwruyrbzykvIHzFEhZY06nILx1ZbxNjmJOz3RT3sJ9CYIDkW
	59XHaFsfJOBKnNwLGZ/tqvdK2ZS6KAlioF27WMAEsTIpEMfuRLoRvn88=
X-Gm-Gg: AeBDievKA2kCW+ZMfkqRIY/MXxc/lFdHOCd/UYCwUZmVf4h2VPbYWuAl+LyHnvb49x8
	HZfFh4J2ULB/svoCSIHHbuYc2gvTKGyenmuQE+i18Z3jSPGzEmuWUkZCh6KmcUa74060SxfOTvV
	w2HeNTl3Q2WeknbnrnjbZ/G26Jter81wGeQKlOE5Y9x3jGLolXL3ej6MJUGQO9FaXkjWqKTGMAH
	OfftYVGTY4MvlnnlFhjV19mvXVXdYN6qcyo51WXewEgvCecqSF1lxVG5SvHV9gfUM0dqbOMvjO4
	xwi/wtFVmEfr1QJDqpPQontbKIFcHjyDt9w5B4DJq+DWTZZDoWQlrgEyUGf3qUxIv+CYRcKQTn5
	hQkyGRG8n8iEBlc4yaM6NHQD4yn0CKg5ltL+YBFclO9JQ
X-Received: by 2002:a05:622a:a95c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50dd5cc6a5cmr130724581cf.40.1776010896670;
        Sun, 12 Apr 2026 09:21:36 -0700 (PDT)
X-Received: by 2002:a05:622a:a95c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50dd5cc6a5cmr130724361cf.40.1776010896239;
        Sun, 12 Apr 2026 09:21:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:08 +0200
Subject: [PATCH 6/6] arm64: defconfig: Switch Ethernet drivers to modules
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-6-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5302;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6hjUMCUeW/jKtCLOjUKJmC9SA5p+CIWzsfQo2ryaNME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z7sA5rjDUcsmAbUznz8NXAqE7Mk+lsV4kRt
 cD2pVMvLXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGewAKCRDBN2bmhouD
 13XTD/wNF+xifLCfRmTmHr6SsP9In9fl4flNZO8Unwc9+AMFTciJ3wW7s0qeTbyKO2+VwYIxlVx
 YnkP6fOCOdhgJRoma823+9B18QvnugpzfabDCvz0HIL7/WGXg37OF/vJD6Fi3bmR4kp1PyFJOGg
 AX5glfGva11oQob03406Ye8xPgxbV/gK/V0MuyLgYRo8B6+3rOoRBwVoYoxBr2zywuhlQ1zQPO2
 M2sqd+yRvBDyuy6mlZEOTEKV4iYBr6YhYmGols8IGC5BmjHnPh0pXqKKmzodgge8h/OWf7ZdqwO
 LPDcPxz82R1XTrWdHYka2RXiTjZoahLeiHHRCJFjDcQeO3Y8V/3NsnTWmWBKMyNigm6x/EySAQo
 +bBGCi26GPkCmV4MFoRiZcl+1/wyhsLxv+E03sYNKf/EH1hgPVtYlLf3VRksMFiWUnBc8YpeNiv
 3L0O95S9cE68RonjetC9C0F1A6VtM/zeNX1Ulfj12wFeFuAC5k1hjsGfcsiTl7+2vnC5K/ht9vA
 slPzlOlEL8uJCVvU8utcqOfuz5jcASrRwC9B/ismBy85lEArvLZHcumo5OkUWX1keLqy+StbB0V
 pX2VTEekHFM8HBDCokwkQVY39owuKY1vstWmUm71wNXbV5YmFW2EbJffNxEXt5x0D8XZYgkCndK
 10KaaEKddb5ej9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dbc691 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D03BasQ1alSNJwtn-a8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SV97oJ3Xzos4jwYFZyHelMdfjSHCdjQp
X-Proofpoint-ORIG-GUID: SV97oJ3Xzos4jwYFZyHelMdfjSHCdjQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfXzAND76QGfP0n
 2060pA/ICQja+Pa/1hoXxK6NtFnXiWXBhX/gt2RqzT65sGPAP088iB0VGuPHUMJF4oJFb+6zhDs
 gUhhwHOjT6r/MAoX6eKVNhwTPE51xR/qIzf5lO6pFWz/qgLi6NaYEaSsa3mBANwZp0MnK5y/P67
 w6wtrBZAwPKxcfLO5lHEZ2k73rOKN/xtqn364/4yalLbI04dYNMy6WhM1AI1jfCvTADanW2bpoe
 VnQ2e8M3AAtMRxsyh0MGoTI9aF9qK7130F7QTtN2OBfoEeaSszADDb/NfaDUBdJOAZBCsWLWieE
 Fjl4Uy2fLx9CEpC2f7dOGyCIdRA7nuFIbFxKGnOwp+SuOHtkTtLeYXtIHhLfdVW4heYhWIO5y5k
 YBe9ftPVwVtFPU1/VdCSueo6BgqABvnzqm665/RDzcoNHq+ud1OMZqki9AM5SL/dITwpeZN8LVX
 Y6qfdPiQo7xDDQ7Knxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120159

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
use initramfs with -initrd argument.

Notable exceptions / diff explanations:

1. Intel CONFIG_IGB stays as built-in, because of dependency on I2C
   which is also built-in.

2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
   they were default=y (via ARCH_BCMBCA or ARCH_BCM_IPROC).

3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
   default=m.

Moving code to modules has positive impact on kernel image size, thus
boot time of all users not using above drivers and ability to flash
fixed-size boot partitions.

Old Image size: 41.11 MiB (Image.gz: 14.69 MiB)
New Image size: 39.14 MiB (Image.gz: 13.82 MiB)

bloat-o-meter of vmlinux:
add/remove: 4/6139 grow/shrink: 3/51 up/down: 34547/-2046619 (-2012072)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 67 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 63d4a0f2e388..7d82e90b0405 100644
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
@@ -362,11 +362,14 @@ CONFIG_NET_XGENE=y
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
+CONFIG_E1000=m
+CONFIG_E1000E=m
 CONFIG_IGB=y
-CONFIG_IGBVF=y
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
@@ -1955,7 +1956,7 @@ CONFIG_NFS_V4=y
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

