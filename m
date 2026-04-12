Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DE2E11D2
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010888; cv=none; b=Ym4z+sRhLuQ42XBoLJPmrk5cZDt4uj64QrJQ5j/B1prxiqtWRjcupRjF2rPi6qcpTlHSEdgxv4RfG+0CuEQ2FXx8iq4xUQ2NZ9wUePu8w8+3zJvlXhI/VBQVnmVJe2/viCHeS5/dJ5gq4wu9AwsS3axh65M00tPX5fUJ0glTuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010888; c=relaxed/simple;
	bh=2lDhMUOj2eRpKYIvCqYIbaGo/wqjQ8ioCOIKFwS2wdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neuHoUsNE+j5+wIJxVvnX6BkdS1G5dhW6COVX/bSg4Yw9teDRW+Py7LPbARg+T0LiPQyrw5qNTE1bdYLbjMZ02hjGEkpXVGdpOHP0huupjq8MiGRGpxMUAiPj4LIBl/qUI7DwMofsgsRbd4eFUeIzrvRVuxVLJ0f/XEZNVobdiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fG0yk3iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VW2WQVCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fG0yk3iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VW2WQVCk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE59sY3831155
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=; b=fG0yk3iwSgx932Fq
	IGX7+EU1de5Af46wTCQITKmJuiMXe3afNXlCwDxdbtccOJbtkbiXkMG5lcI8G7O8
	7b/lnF0dJbOhO3TgzUl2I82rX7JyYDolU92kxEzUJ4SqnxR40Wc7emJnAGi9Bt/a
	3O4Hn10FmFcPN2GwcS80T3dwds4XJtKktxLoXZKxWKWuYXbMk70tr+j++nz77VPl
	VV9ikJqKcs4sBlCImk+WsJx6fkuG+qejq4/Hgtq6nKrrGl324uGozJqV8RUIbSPK
	kPQSRMv2LY9X0ea1MwYh5Jrag+IPlx536KZjn0uh1JHxd46YogSiRiWS8pxgE6AQ
	HMd+xw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew02mwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so71941291cf.3
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010885; x=1776615685; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=;
        b=VW2WQVCkgtWqAdxJ9npA3cUZ12xHzOJnXd9F4PpPtFPclSpYWoKcr+6rqQbD5UkztX
         rMR5YPfC0+OFmMEv7LeDcJj7/GvQd3PjigBa4WTkwsVuw4OqldQzXb8Te62q5kmqjJOq
         o3YTcZX3/WiHkVXkfSIk+qDb56a5InWCrTUsqeqKYSuWVG7r9FOHBcCCzg1kW/xSBr04
         EbGZiqRVx6Nnput5NbqE4veetSOb8S8y48bi8fqnq3Y41TfykSDQBd13uVWLhURaNx88
         Nc4TZPmU4GYVliFbpeJ/j5vxx4rSIRvQskU4VRM4ap47Bg2SmIEChWmAEDGvyjbQzgEI
         XExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010885; x=1776615685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=;
        b=O7IEXJiNzR34Vp+wp7JXXOAWEP44fJHb7FKSUMd4rZA5wPCoUfv0gtJRu8A+ZF+sxh
         BwLYKXux4+nxsFptwhUlLKuXNVhBL4dk5vJ0i9/CTnpbRj7Dl1+gFnDPdjMviG7LxzrL
         gKXWndN4eZgigH6mU9HCjvV72TaNYSGbNDnaXT7t9Amx/6KPe3owIiJmDuW/FJgEMOhv
         J/FrSPtqjP1+siZV4PmDwpVZTfqxzZ4P2TDnymid1JCzmgUcDMvkBq3gyCcXO0kyb77p
         bbawCl/eVchWYwjlySLY6KjRDZHyAQDbzwnxXFhxW0AXLKgMDrxsj0j2ix98iHXfvG68
         U5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVxplsQn/QbwE/yNPHlrmyXPNzIEBbN4YYVIH7D+LOY7im6IVMM9yIa36EXbZf0Yul6jQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyG8OxeSwthwD4KyNxwN8KWNUfiV/MVrkIuS30p/6NyBweYWnXL
	I+Zstw0kwGPCgzDtiGuoxdzRIOcywaYJZ+rUoPC0rXOrrTY0zdQD6gcHMszg9TT1wcc8S3xWRxa
	wZrYTef7IT9oGDmaGlTWH9rR6qsVG357e7etJyWIsMiq/QExPRz1LWK8=
X-Gm-Gg: AeBDieuSXV0ILdAIxY7R+wSnMUoLwv45swbnSM0BmzN7Racc8Kgvnlor8xRccMURn9M
	X/ghPq+wGTP6Ybhc7qkbqBj2HshoAZDydcfifFwVN/EmAoCBU1kCpEcA8J4jVU0fLxs8k+/dRgd
	a6IUh/B4QixaDHQIeELfCItGmy7IrMmd8xopAQD+oTNrOWMx56yHlOWcdGmTZWBl+qCiNfEOd6y
	y5V9SsVAbiDpUf7Uu2IL4KqvL59rXe6ml8a1y7QZl3RaT5G7/5R50MU9umdUSg2OXPYbKlPn3Ry
	2l2giT2FcLMyUXCNmGfI2zdC6/WU2ZqnawvP7VNFF0B89DB8Q3T+MQAcCHWy7CtYDwaJL/9+Ilm
	KwunETIuZX6giO0Vg+eEj98zXqN4VIi+aqrTVgrPcCBL4
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr152015511cf.16.1776010885123;
        Sun, 12 Apr 2026 09:21:25 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr152015211cf.16.1776010884699;
        Sun, 12 Apr 2026 09:21:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:04 +0200
Subject: [PATCH 2/6] arm64: defconfig: Drop unused legacy netfilter options
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2lDhMUOj2eRpKYIvCqYIbaGo/wqjQ8ioCOIKFwS2wdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z3LBbbVOzBWtwkiL974rkN1/lJesx/tq0CR
 pPzAvMJCa2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGdwAKCRDBN2bmhouD
 1w6hD/93gYyt7hPSTpworLH/Xgg0H6slKPjrH8K8gLwlvZ4fenJbolJcaIQok2Flqvbt8F7jIZz
 C9X9cHtW5D7Z9saFij9D5y85xFKuBmcJmBhb3ed3aMQW7UUQVbQ+FwqN+KSsfRezhW5bgfpHlIM
 lwOibyCS5WFgTL98PzlaxWhpx17FWnQcvXsCXw74Vv3hrouxC1VCS6y2Bz9gtcVWX5x0SPh8T+W
 V1IghlSfPetYYAy7+eNWfeVK/lxeHQh07YEYPKX0fO2QChpPaS8SY3TXyOBUruoGvrqqU1cOMn1
 EectPGAycjVMqk+NuWz4+WoCwYR2y9SbnAb722W9UEZjeF8fZZNOF9QoaJBrbrbVsO1fknTEj/E
 Tx2kQxQKkWgTKN3AFn91VJW33sKvR8Q2ZQvcQNZ8I0hynW5uKP+7mXgjC12q96w0sWLkXFTTtc4
 qlhs4ZNnQCB49CHG0oepa1aUWVQiDeNBzzWhqcltg2KU/77VGV/rVX2sdhHzwJY1nycYzPSnAyw
 oOw4vrv6tx2p07O2iFEwKWIhLpoz6/us0fye4QFII3K8ghnze9jbcCYOTT+J7gjFpmTqPTif7qx
 +bcHiPtIw12aYetHsek79IAcTQn9C7aKWWYBi25lYKiNLx7nY0SgRswZEM7+hqTokXgbHZbu1ei
 jUFjHno2qMT2l7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX2HdW7T2/pv5V
 1aEAHWx+YPLDDwx9sfH72F1Q3+8gvNSsdO9TgmL8LepKC9tw6UszUyXIptlsmmWGPaNOCPmvmJI
 OVsFKUNjWFx49IM0IjoQmLEMTZ/Hi5npRkw0jDogTyU02BxIozJUGXBavZfbYZkUft/qhgW9Ejv
 jwHpEf/G/Xq5lalamHJxeeLhZctZ3vSLRiMWniikQJurF1cloAkUsYBmZgcD8jRgiuI4KwTy02u
 tmuckV+6g0SBbDnWCawRj0USC0c78OXStLRtGO6BEz6hcjC8uodQduDcX1Xaf25D/Si/CwsEZIp
 WMFRjV17kGX1QoJYRLM43zV5mlt1S2C2CcPGurM9eUzkckYx2rFFGF9L4+k+dCHX0rYYQ9Atz/b
 HykL94AFkF4WfUcIU65RG4uNVKhq2r4IiV9uxP2XDLfFneFBqn8XW4ehDjixhubIPcFvdlmiYxY
 RDQx9K90a8kWBmTvuyg==
X-Proofpoint-GUID: xvFhIx5rqXldzY56IeAP65Y6J-Mwu2dz
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dbc685 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=k-PMdL3Rd_3TYoQcjAcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xvFhIx5rqXldzY56IeAP65Y6J-Mwu2dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159

Drop all options which are ineffective now, because they depend on
disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c03ae2c767e..9a31b258a56e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -155,17 +155,7 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 CONFIG_IP_VS=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_NET_DSA=m

-- 
2.51.0

