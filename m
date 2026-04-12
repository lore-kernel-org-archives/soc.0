Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725D2FA0DF
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010894; cv=none; b=VXb8xMNnBk0gVSGTP76tEux6VNR4r5A0tpxZYuAuTQEefr2MWSTsjUttuE5+qgBjOsH4kTOtCwzo6fBJ5yiRDqBTZsma6pSvfmZa7/90Mn8R/QAnuEZwb/RPO9w6UgriCkL/gcjYv7LgY8N3weT+Ia4PkyGxF3v+KmgNJawKLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010894; c=relaxed/simple;
	bh=p57QL94DUC2N2RA2ayDnsuY1vtfCHMCy3uf6V7BOGPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oqj4wrN9KURw+ccwRAPZz+5wsiAt6LTKLA9qRGqjY3vO8zEb8D6jcJoaa9A7iQHY1StrGJG+AcGwZ/XR1Q4Q1hlNG+7GKEUeqOJeSSiGpeGi6cXHAG+KcenNrQawZu1hwHF/iIWZUjqJ+1wMndc0eY1giaVx2CANmwSsZqjNLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAElOvsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck9bef40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAElOvsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck9bef40"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4hx82661899
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=; b=jAElOvsTmKxD+dHz
	Qr2bJ5zsUfopT8yDFm1gN6Fl5DSvNgrgT3IGhjTi8mUACJ7yIBFtwKA0sz/1FDTp
	4Xnz2Qma0ieguEZXB/thqKcwh9/WBL6fL8RVtr8idfjKwlxttd7fnItBeqlxpA0d
	nbsMMUzEN7cm/H72BEs9KYpW6cj1CSvZk6jRWu/YdvhvyAp/0vYyKnRpVb8KuDLu
	OxyXJKpDISHPw+Z9XIK/ZCNgcLXCF0RBmuJ5AsL9afoVMrwlp0LSqRu5LzgBRjKp
	JXsgHDj3LzBePuogpzUB7JCV5PDBVGuruge7F5/KMljGhry26gnglz9WKPOIEdGQ
	BffenQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexctmh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so68363071cf.3
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010892; x=1776615692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=;
        b=Ck9bef40Fj+0Dg7vxMY214eEPVQQEYk88LISpi4pYP+Ut60YewP0lTjZh+rpLGia15
         PMtKFWBvP70b2tHhHNubZ/qxLW+d0NpzTDVRq1eiLxsXHgNB72JWQkHvjIIGD+Rto1Rv
         Q+nDf+sOjRF+HApXEKUzrryOPFA8hykHWGBIvyQvd3K5xzby/a+GQqL3TJs9JXUVFMpu
         SJhwgTaoiDelVM77qbHXKUQsSm2G8nM1sbDD/4+LHEv/00ICKp1bZ7hzRbOwzk9qtNpr
         oFagvLDnDZId2Wq+Yq8GA2xnDiK0LOmb38xnjEkVxKfIE90Iw1p2odYirBi+qA41PKK9
         fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010892; x=1776615692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=;
        b=O9qMtGxD8m3r2Cu7rF572TfO/B54sbicG4rpzBYNkSKkEbpvVctez3zmMQf5g3NmF9
         IDPFUi+qHwbdPqL/5oskIcz64wFUw5BfaWxF2B4sdFDzf1YCwbpMUH57jPBHWCnZt4Ha
         ELYrO7nCAiI4EFI2Ine8cm+Ev8hbcQnQQgNcfmfJUjIq0g1GY4EHnY3xANRlOpXfpVth
         YjAox0/hVKLjDrs5xCEZiZ9AMUDBogsiq9oZpOyXHREpCLV0UPJRZ7gqz0Yl9ldRg5UM
         Rv7XflpYpfVsNqg3JCPXVcxkmrpSiW17v1XyuXqRea0fPTMvY1JI/yvXQ+znn6tz++A4
         +gHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVENYDCGPoxJkElD7Rk3uL4lBekwF0hlA/nFKY+KQXiCcQXtWi4wM4srqUno5NH0L7tHIc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdxzg/TJ8K29noOSPj8p9EGN5jQFQwb29KRLwlUj+jDnUxVgav
	g7pk+mV5JQpB3vK4wbHj9jSif7dT3Q4PvUTFC/E+BUNDhyAExU/Yi4RqkdqFas37Iy1PHZDAwDG
	iBWC+Hm82WIyQ3yKwYJxlbxEEou8x4yCCA1lD1RSECANM8KM4l2TNyKY=
X-Gm-Gg: AeBDietE4I8vb0PfGOQnu1UEeeVFvCOk3mXLvwaVOZBJ99u9vhcUiDcai4iu35cNg2H
	enhUK0Y1iolnDX18rKSRFupBJwObC6yobEAWj5698jfSHHkX1ETpukRuRVwRuQxuJPkvfTQJH1z
	pBwESJEoylMOVkrJHzs84p7376TtgVyzQH17A/KJaFVVwd+4bWoF7FY918/fTiIQ3LhZt+gO9FK
	mJruVTv1ikWfesUwaIh7SCB8yvhvqrSIGdY1FfiNzPZxOvPpn4QIYqyu6AK0moPYV7cDugmufF7
	TuXF04kDo+9aOiNH/8NhqSW58B4kcDnihOLCX3Unq7VAGSNB3TGFAXcB1P+dz2fGRlAH0FkZCc4
	9ZMN03wG0P5DDI6ffNPYI7ubRyC8AiyxanSF8Uj1fFqfO
X-Received: by 2002:a05:622a:1344:b0:50b:3895:fac2 with SMTP id d75a77b69052e-50dd5c02ae5mr164389201cf.61.1776010891659;
        Sun, 12 Apr 2026 09:21:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:50b:3895:fac2 with SMTP id d75a77b69052e-50dd5c02ae5mr164388781cf.61.1776010891220;
        Sun, 12 Apr 2026 09:21:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:06 +0200
Subject: [PATCH 4/6] arm64: defconfig: Drop unused Ethernet vendors
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p57QL94DUC2N2RA2ayDnsuY1vtfCHMCy3uf6V7BOGPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z5QjzuVfpztSYLfrMPVlsCxMIAlWXjyuc9N
 XQnXbz851eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGeQAKCRDBN2bmhouD
 1zAiD/9WmDEKnfgYidm9oU9i//4s3enb/xf6oIoDMGelpZXLRQu7+yUuuIabpG6tAVoXq7wqwAE
 Oz81H+A77OFm2OA6I8TvteGklhYIdGOZ1o85UcpBFopldbDT6I0I1B9SCPr7ilCVD9EFWiQ7l5d
 9tJfEcwuIR4rClCSs4vBMag2JdBqHmKEwH2CF9B4y2Hzd7bfPXXTYNimJlX5Pj55CrgbA8Md54e
 H/NuSGuDo57JfgV9WuNs2gxMOykV6G/HWiJ1g9LhHS3713X7nX/ISZFwX9tY+v1tR3WrTNmut6G
 kjivYj70GrqPIWvfzGIf6IugtU1YGNLf2Cw1w9G8jl398I14VI4aSzJZIURsQ4lJzzLbf09Ok7x
 BmovfKxiKDRg0uZCXKWTUILp1cGkbVW8cf0Ise9UKME0xDo60AVQKqHD+qJvxGm3pkNVPRDRUw8
 QsNcoCkp0954sRlybVx73pUY4NsdMNOh3mcsWEN9HMIVGZ/dnHj5N7sK/op/CU6Bv6pzEGbkaQO
 ofyZHfKos8VF4d5GM3AjTfUvcbhQnrtp173SYFYht5Ay3wuCJ7N50WD64o5lJmowg2JxqybbOn8
 9YX6cK0f2w+QJCyE9flslbKmzUgZS8rG07WfsvjT9O+jzcx7YH6akdrgPVX2SdGOucjhJ2+nQD3
 usNrqRkb0HCd3Uw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX+s17qF0cRa3C
 zHoBzOQRoOo5qRKW8f7/ikkSkhrJOIwWHZqDYIESIygYIn8N7uw34yYYNF/JmEkaZL9rYZ8AXnI
 hhluUgKsCjRlH62bD0ZkAxFimEgFxMq6wfENmA+E5rPKWDvETxu6Ra2LQ7WFoCvqdiEUDoTOVZw
 5BUrrOvK3lGizbnrl+/0tgvicnaAZ2W+6DA75za9GVr8LhclxELeBa4IlMLeFCd0ndcPrUBHuAe
 n0c2XZaIqsx4gCSL5hOtRIiN7q3rjvGZDVOjSsiwPpLd0HkfS3fjsxYgXPDMAtcZaGcwHaVmcMT
 ULzY/QuIBSsb+aVTHktDFIYs7WDzCQLi2FeNmb/H/x/zD1CubKKwRwNBtkFNKMMTDcL8opd7Q9J
 cH50D5K864mdeJja67YC8rMZkW5N8GhRPqY4142y/tiSNHJD3msWo8FjH8dp86OeB8hr3Vn5jjj
 iVqh14vyZIkZT7CY5EQ==
X-Proofpoint-GUID: lyERhzt6uooZGHp8P8SsZg6Pk8MxQSxH
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dbc68c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s0ajyRo-FUR_dJIxqt8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lyERhzt6uooZGHp8P8SsZg6Pk8MxQSxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159

Make going through `make menuconfig` easier by disabling the unused
Ethernet vendor menu options, where no actual driver for given vendor is
selected.

Impact checked with comparing old and new autoconf.h:
  diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9f6d5d6ef69..79f6294fffdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MHI_NET=m
 CONFIG_NET_DSA_BCM_SF2=m
 CONFIG_NET_DSA_MSCC_FELIX=m
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ACTIONS is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
 CONFIG_SYSTEMPORT=m
 CONFIG_MACB=y
 CONFIG_THUNDER_NIC_PF=y
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
 CONFIG_FEC=y
 CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
@@ -367,16 +385,21 @@ CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
 CONFIG_HNS3=y
 CONFIG_HNS3_HCLGE=y
 CONFIG_HNS3_ENET=y
+# CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
 CONFIG_IGB=y
 CONFIG_IGBVF=y
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
@@ -385,13 +408,34 @@ CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
 CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y
+# CONFIG_NET_VENDOR_META is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MUCSE is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
+# CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_RTSN=y
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
@@ -399,8 +443,15 @@ CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_TI_ICSSG_PRUETH=m
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_XILINX_AXI_EMAC=m
 CONFIG_QCOM_IPA=m
 CONFIG_MESON_GXL_PHY=m

-- 
2.51.0

