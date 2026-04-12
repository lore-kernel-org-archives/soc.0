Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A66A2DF126
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010897; cv=none; b=U3IXzhCUTPxYbxGkfoWmPycEOR5xua6NDEc5E9r0Hlj0UJxL0uyyPDHDRmotglaHAqTuN5uFnY+JLjj1f23jENWHEgNgDl4c2OYUUc/89xeEVeYgJ/JkCTXsgFOMXjU63BQiyLucXMNfDV+N3wbCeG/Juidi+CcRnW0NzI4T7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010897; c=relaxed/simple;
	bh=CiY1VdwgHFoYRnk7MGs2AOg05GfC6PjF0P2dUeJrGJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFiy2Nfdq7sd2MlkU9ZY3GhhvmCMWJV/zPlkHmvcJgL4APNE6nJmM3dYi7Mc/ByFfxWGxUtt/f+KEc2i0uY7KHlNRqDmbwqCrVI9WuZmHfou30JH9GncsK6cRKTGkhfPJ9Q7FZWWBq/re1sqkQUqbam8+9HBpCUa+pz9ietadVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWindp96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CObsEr+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWindp96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CObsEr+M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4sS13830849
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=; b=mWindp96Z8Tffgus
	PDCVP2RxsLNLDKQcb2FWChWacO331vyDEi1ILY5HoPWQZSgkfjKmkAYUJnZpmsbE
	ehi8RKfqEuWLJ2rlQKh6EXIxGR/+djpfvm5meiePhfABrML8umj8aACyWnY7s/Eq
	opBYytE6XntL55j+RUMzUiVnDcrWohx29stcRLGUd2QK8pfSbWNovyx5d7HWGI0z
	zLKt8zc9W18JUdk4eDA/XfVxoGTdzuv3s4MNQ1IUGuIcBgJRMrhST05KjdAyLG9A
	hbDqNNIQU6Lgx5hiUkAjmDzYOT7iYJC8Pgaohb0ar1FJqH73rQbKVHWFXpHrhjRs
	T1wA2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew02mwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so43493921cf.0
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010895; x=1776615695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=;
        b=CObsEr+M6YQKkZJwkK2wvfOjnEstwsmrL8B7qlJ/07l2BJ+1qJJms6zg0tLObiBnUi
         u/5mltsYzGBV4ljeXrFHZZftAWN7qp+8K3d3kbksbxAaYXMqvGlCutdQZcyPhnY2o/k3
         xiF/zwgrKlzpwWYWkLR+3q+zsRRrNgdozRwsto9VX17yCiGS0+8iq6nWbL/WRuNPpS1f
         wfS2tQRkz+8A8SiJNSTi6XCOXIionJCKcPRacZXQZuAYtEilJx7lGD1JSecZbqHmJfRZ
         jGl/4au/CARqTJ2BFPUQkm+WipBnET/b4+L1ApIWFMMWeOBP09GDsltBDxphva/Lwtej
         FyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010895; x=1776615695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=;
        b=nlvnOCiLIVmFpndTKAdgUgW6UQSV3hWju24eAw8D7iwA2ccGnZOOTjpHW0pAQvxuMl
         h10ODnkXsDD/4/R2HH1dLU9gEWmy+vzxijwoJJWehcI525arcBQJL/f9G71IyWzIIbgq
         CPRRzRLmm5DvS6+vrIS9RihnK3Y++VV6GssLpWfeE41ysm45f/Mdjh1RQjgdm0ekz2Ie
         wNrYWTNbBx3qT4gR6Vspxjj+7BUGvDr6dYlC3I9e71TVJpD1UpC9uR2iG+fk0nC6b+C4
         mfZwLGBt9IeBQMSZCrXaExSNX5WiiY2NDq3EGSC8kNNJdQl5atxC0wx5m0WPTustKppg
         ftAw==
X-Forwarded-Encrypted: i=1; AJvYcCUg6LigklXV9BToC1rlveGuJqgKAKsZixZRblTC1snH+c9EoKqs0L4idiTnQ6pZING7Vew=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfimy9Gx41RuaClfK9MZuEl3Eph7bcHm0Vv0x+s3MhsyiESCbt
	U0A+JeAUO5XMxm9Vxx6JGsrFee8cp9NM17TWva6pEH3Q6NfiXzAYmxclwrkSnnKwvHqi0I/yPJ4
	J/d5NFxlqcPGnCIJjXhlOTdCvadDSZtXw3wj4uoE6HNAIeEWSrAZVoxw=
X-Gm-Gg: AeBDiesEzE11pE8drW0Q5dPJWNp7+vyypL7OHVG5LvR8W7lDpVhvu9Qd4II5qnsz0hb
	1gM6sVZYG5ZjSyvSrfbDzUOaD0m/nwGiES+oenQ2wMeSPLY7gYUkHZcpxISX2WmclSltGdyey/t
	otEL42PuFulvWcceLQTGX+nr0JTWMFVAWsqOosQDNOxeSO481FuA8EAuctwS9oATRnLzMeN0Egy
	ghEVEK9iY2ARLzKYMLFkZLQgStceGPXGtuzJhd/tJ2gi5EuAe8vIuLec47G71uAyaNYfphvsxT3
	kUCLaPmskj7E9HwDaW6PRPCfuKzovCg4x0CEIZH1YwO+L+kIZeYBNAni1Io/U8Lvf7apsvG23OV
	WGW+uu5n76YCh/0Jgw+Rt1EOMxTUJALcfb6TPoWzhaI33
X-Received: by 2002:a05:622a:1189:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50dd5bcf32emr148401891cf.31.1776010894694;
        Sun, 12 Apr 2026 09:21:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50dd5bcf32emr148401491cf.31.1776010894221;
        Sun, 12 Apr 2026 09:21:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:07 +0200
Subject: [PATCH 5/6] arm64: defconfig: Drop AMD XGBE Ethernet driver
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-5-a46918286451@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CiY1VdwgHFoYRnk7MGs2AOg05GfC6PjF0P2dUeJrGJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z6VbiMRFDVvstKd+grSdX05GB7agnMyL7Fl
 GqYpt/76hSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGegAKCRDBN2bmhouD
 1/e4D/93OGJVZ+xs83xfyx8SWt/ni/1hg/nI3F4jlyvsS/kqnA/P9KtIhUo3JGZRbK4dxBmdZ/y
 6GsOwTP0/h1hS1+u2BDs9CF6FlM3qBxHy9nflJ9eY88Mkull+cpgp2L8/cUrmlGQOS27o2duZ6y
 GJkIjGV0sffkwKF3WW/XyoSj9ggagT2fPh0Iq3LrryW5tun/eZH1HhedQJYEs72kTBXSRcNDRQ1
 WkMuu4lpyVSlzJQLG0/QcOsqhhIwYRrroKAGoHJpwLAeK+Agtjn4AHlkPl/LF3jXKFCvCT3y8J+
 Rwmpyp1IUQwaIRTqn+nEHmgLplu+4WXDRGllSjvYi9+cy2y/Vq7J+17V5nqKTXbyvkV0mrvk2kP
 mbI8jAJjlx6rvWJJpggnhBY+GjXUrx1AvZ+7sHU3/lCXQ2tq7GvUATCDE+r0v9yOyny3jSP65J9
 nI74w647xlN+qzM+WmfXafWKvv9yLI3KtqQiV8fIqC6Ria7tzrcfzlHLL2u3TuLvvqFcYjsUism
 Jk+QEKQAaBXxhFWgnmmWOGRacoAoGq5gjGESPEIU1ixcqR2NXRlKKFXWQGaqBNKF8qrQe1cn86u
 SOqU31E19WvrXwk6OBpZ7Rdrw/rFvauCp24UurWvBBd9JG1ZVggnCWy0+zHUpsVIFa2vU+9CNm6
 pLyEsq9sz6I8aqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX6y0H1KVe0Mes
 Qm4uaQJG3rZOyrGK4g4kvZfW3SRRkWM0sDUt8KyP4WrhGgGu/+BR2M2xvd642Pj+JW1a+4HuQRz
 L9dYnKsKKXcmfLMgkNrYn0Stat61wR6ORr3KCdQaGJq3hcZUuxfAbbcm8iVlLcZiviTq5R0YUbQ
 qCJsPZGv4Ont3Kxynosp/2H6t7VGokQ7WFGFM7h3VEWACkG/jje2lR5uYqq/PAWfvz0xvKptjHF
 1ovDkkMuArGS7/DVskdTJbsK84HntZSG0DxVZeA9PQ3p+WxTz9tPAxq4qJfj38WKQxbltpiBhPw
 gvp2sReAlUFBwIUIA974CMQS6dur4DJjViarTjGXc1l1Xb5Lmp8uHxJWRJYUaz7UCvV7B4thpuV
 x309tYdSk7QcUBPNGXxf8y7XUsRh4Ybatzv82IL21QZPVXLrAuVNCMIOXqkqgeOkaE0Egsp/30Q
 V308k/6jiMPj61/FCeA==
X-Proofpoint-GUID: tVmJV2b7v16_xweqY8EQTPgpPSmc_0Dx
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dbc68f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4yfb2UTZCF5Zq5gxaBYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tVmJV2b7v16_xweqY8EQTPgpPSmc_0Dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159

AMD XGBE Ethernet driver was enabled for KVM/QEMU, but QEMU dropped
support for it in v10.2.  Driver probably is not used on any other
arm64 platforms, at least ones not being used for development with
defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 79f6294fffdf..63d4a0f2e388 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -356,7 +356,7 @@ CONFIG_NET_DSA_MSCC_FELIX=m
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
-CONFIG_AMD_XGBE=y
+# CONFIG_NET_VENDOR_AMD is not set
 CONFIG_NET_XGENE=y
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set

-- 
2.51.0

