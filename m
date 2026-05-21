Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FB33D6E6
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376929; cv=none; b=cCGAhbaY+KoEtJzPglYoIyjQXmg58sgbdebTmF0Nyx96pPQ8Ma5SquBjq1T5Yt1F8rPfcs7Po9c228QvECM9IWE9FeyopNegsP3fvlE6px0iCxexy/l828ZYwLnj19WwaLu2NFZaV+8geAvB+OeJfuA7QKJQjILqOJNoxE0Ptic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376929; c=relaxed/simple;
	bh=fgnlWbgsaZzFYCXJtiG/h4Vlk+arY4lXZp9jyDZusNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lgk9jg7IKrYcUTwx5LHg44QST1wrTyta2X5nf8Xva5vLw/E4bDLH2eGCPemHTrRP3flbzlFPAPUCufs4/y9sXFYrkVJZyNtHvFicKqDEGN3vygI0hxGItd5PXJzZ0z4Y9PN1wWktnxymUxlfE+/yzIDSD7syM0sNRT8F4XQ2kgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POI/BBOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivdFjFVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POI/BBOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivdFjFVp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A0DX3451693
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+F
	ocw+/W18=; b=POI/BBOvf2V1GcJCpvelaK29BrHRtxRnCZV3MVOnG0jORW1QNOS
	3Uwyj7aXSgYpZ8ymqzoqyAyI1UfBysySPcUYKmu5MnnHJrxRxv+qqND1ZocyvqKR
	ETIaPbrVFPNwAySv8RbeGuGNuKLysbjYYNxOE1hovt9o8+7alylHIuzb3lnjJ7Hk
	ipwOoyVnCacZJm3CQJ4XvoRbYUdAJ/z9kQzrmcRYnBO6ULce+Czzsdpwt1tB1tRA
	6YwaGpt62k+vHltsgVE1DxRGSNq4u7hcpM3biyDIUb550orwUE82jdpXpGyAdIvp
	98WMaJuzY1bY6dUN3CPet/TwNEXE/fmmtUw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h9jhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:22:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso3861674241.0
        for <soc@lists.linux.dev>; Thu, 21 May 2026 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779376926; x=1779981726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+Focw+/W18=;
        b=ivdFjFVpINuDtD9PWV8US6WAfCBQj3nLm3o+j180PE1TC5VkYunKUd11rkixsPRVYL
         +rMx7j3fItD5kmijkI9lYu9jbDChaHaz8RiSSTXW+IBr/Moi1J1Ydjni6F8ESyhaHJ4q
         4NNRdm7Y8YQCExiODdce2vYS3z5+pe8B4ISVduWvzByGvy1gysZ8TRuClDQ0DChjN5DZ
         gIUakkM6DEh0viVOOLDmN58LFXqVMaUvw2khNr8ge5a5FuSiVRoBrv2dD+xHrZp09RxP
         efOBMIHdS4QBnWx79rsWbiM5WWCpjy888wSaoN8C26Un1qT56wqcFudErPvjQbguFFN1
         0wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376926; x=1779981726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+Focw+/W18=;
        b=QedzIYx1ol2bYv9iEm9FFs6eOR8t4+4/Uptk4iVKCN6YyQCp+/KPFUaK0MqbEVQyuD
         JkqM5S/D4P6zGLe2jrdB8jAm6F0+nMI14e8YlfUVu5CLIZ4q66MvBMoHkKJRtCBVKaor
         ED6s6v761jZm6ZrWMHgzndZvlBBX5KsMBlS24hy3tCBq+dIcCRBC+gVNqXdi47PXkwlp
         qJCCFNYWxtFgMUOQZtzk2Hc1rOiosM3g599eWri+Hz3qKCLbc3nApDHC9hsD3Sh/tacR
         vgnGsHVLEA18sHj41XkWF34FNzu6K6bTiDeSJl/u7VlwFF+cBi9eyQyNFgMe1L41Pb4w
         rGVw==
X-Forwarded-Encrypted: i=1; AFNElJ93AXeHCwqw97flMfVZCtxyTO4zpoSASijhSvV3gMcDCSe8vKKrNJTX1+KEBiQ2pe+fUW4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVH6H2fFzP9tYVrW59GeYWQagzHZDqcJi22rDbMZZNzGdxAlVx
	yCiJMTqqV0Kg/4s9gV0skkVnsqCOIVVZLLhvBYs6ehKPFR712WcAfRqcpfAg4WgOZjo8ZaXN6qe
	ZY5fDzGxJHom8uTgKdxJQ9/x6Nvz4rPEH76HF8nMTYTl6ga/HmEa3ZhQ=
X-Gm-Gg: Acq92OEs8fokh7GAtfEnpN2wv6pn/pDlMyT5POAcB7LTrJXGNUfVUxQaNCBJ+3nbsL1
	1pSPqNdizmfSlLzNaTyQDnJJ/BrCOVMgMLUKUSUQPvLqCav6LwbIijh2pAQOW7yFE9F3xsLVTl1
	WHHgSn1eg1QhmR2xyJOV6PhxeCQd3B4A5NDKV97/2qHleP80IFqA3Q8gbMlhK0zio7l2dzJu5ER
	5td94SqXohJp1s1Q30n+ShGQqCHjcCK2Yi+F24rIOnuqvbcW9pV5DRvG7Vx9/ayyqLAdNpXPIWC
	8GWOdB5XK7sqp6pqKQcte+qBL/NPIVmEetGeCeVFGVZJb8EX84MUUt0SBOR0fBSMyTChM12p/Gq
	SBktLaGW1eudCx8EaUS7iKfaHOr/MDI7EUmqKcUHU/ItJjH8=
X-Received: by 2002:a05:6102:dc8:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-6739b4ff142mr1955235137.22.1779376925685;
        Thu, 21 May 2026 08:22:05 -0700 (PDT)
X-Received: by 2002:a05:6102:dc8:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-6739b4ff142mr1955195137.22.1779376925290;
        Thu, 21 May 2026 08:22:05 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d29csm3848191f8f.37.2026.05.21.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:22:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH] arm64: defconfig: Drop non-existing (yet) PCI_SKY1_HOST
Date: Thu, 21 May 2026 17:21:59 +0200
Message-ID: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fgnlWbgsaZzFYCXJtiG/h4Vlk+arY4lXZp9jyDZusNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDyMWEQYxhCog8K9oR4uNVnaybXvnRrFpyQJj8
 LZzv0LNI7aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag8jFgAKCRDBN2bmhouD
 11+HD/wN/ryT/aj5ZfxoVRkRc6V+t9wQyi0b41oLpDkjKfjCbyPv/KHm+5powI2ouHp2CMvhf8z
 3Ez6ynnkr73eqDuX7dP2XMhAdKWuvQTNq2+xzARSpVSO1rxkXuJKbsRBRgyuMOXoRhQW2Ixinp7
 Q+v4hOdIbXO5UznX+Az0jOouywVXgCnPSKOnuaTf7DVHe/xh4BoxxdRfFJFHCfyi4ziWIG8QwVS
 IX45mhAAhhXip2MoB+i4OrkksZGXa0MTcAZJKG7AIoAb/0vQOJcr8bKxS7DHvxj2HK2FmTonOii
 qLW7EKN61ihXb6j1D17FQXCgbREJIma5ttCNDWZn+P7l81e9EExNeGfccHiRM8s69Mu6jbhlEmY
 DW8qMj5FzPjDPVxqyGbyDYEzSo8tfDZ6+iyV73XHQNwhm9xcfjnXon1f/Ud8B+nriO4PcE5nTu4
 u55HbADdho4FpqtpO5tGAXdXRB9a6f0OX2Yk/47551+yiXqNqLnd3xE90EMBkCsZRoDLVrTOWzV
 t5d2CBF0GtAVYePZ2nWUH9hHiwHwQ/aBG2gFicTd+S3SNoIdZmgtm+wMTswYdKSTgC0gP+G8vkq
 3FhKhCeg1K+xQow5UwtE7SN8cigD6Pna7UIXQTqmGfuSdVoFAFbDHbz3JUvxZGne9Rr9QUbmOvS nllgx1Dmy38D4+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cmJ1u_6ns5NQEkx5LYtvYGgrDvLdUtYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NCBTYWx0ZWRfXyOE2tTg249C/
 OntRIjadEzmdl2rpDdVl5wH5bbCoew0pKAR5hG9V2x4xxDE0CyaT/oSkFFedP6CMFzTuBxJ6rAf
 WCZ4kPxqyAi14RSdjIBoB/4W4hD3HQLp+i3JCSLstpJfRp/cEjeu8qPyQuOaQ0O3ol5A63cY0lt
 77eIXxePnjOHm5895arDTuPtbqi8ysq5sJy3ipoNfU8VUAt/4roYTP7HbenZgvthM5PVMp1qi7E
 k3nJP51h/rV1jwL0NFjJ6YmkqdePozHxomN5V9zKv1nDNpgEaLZeC+5fKNnzW9OpZk6Un/lQSty
 Fh7ysHdDDDpLy5Rcmd+qNY6sQp7c5j6s+lzXHeLQwBmdy1hc4efWVB+44cp4ElGEDQTHdnAycPa
 V32rJGupE/BvzByTaAwAXFotG4AOtjz5u8PrmoLQl96ULoyoheFHR7txzjVWBxuzEdlCFNMgCjS
 fNQsvYhChnJxWoijpcA==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f231e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=WSa9cALPJrNn3eHyELcA:9
 a=TOPH6uDL9cOC6tEoww4z:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: cmJ1u_6ns5NQEkx5LYtvYGgrDvLdUtYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210154

The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
entries to match savedefconfig") included reorganizing around
PCI_SKY1_HOST, which is only in next at that time and was not merged to
soc tree.  Applying that patch caused some conflicts which were not
really resolved correctly and PCI_SKY1_HOST was added.

Cc: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This should go to soc/defconfig branch.

The PCI_SKY1_HOST will come later with:
https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..4ed684efbbba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
 CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
-CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_J721E_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
-- 
2.53.0

