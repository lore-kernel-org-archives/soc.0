Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6053164A5
	for <soc@lists.linux.dev>; Wed,  3 Dec 2025 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786292; cv=none; b=jF+1HOg0pgC935lolrN0E2/L3aH/ZP9ZBz3JRFTvBg8OQWLRLn6NSCGumtx7UxaHmbBYnkcWM+5dITIlw8SRgxzzpRE67bvAc5jvAzmgyX1AJps2zHRmFxJiirIUuxnu+4comNPh6OoWNrnWeVAlnboY4SDIOUb8Ld88NYs8s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786292; c=relaxed/simple;
	bh=zJ62/ivIS8xYXbPhT09JHreQwFGE4n//CNIlb+GcW18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byGDMUUbvzspKhj3wVtG6Z4+h8Ao98eIO69KDX0l7gsJuacs0WhWtwaeaQKwY2Bbw/yPyHU6ETo+lwbnH9pYl/FvscLM6VSRE8tkvQ17EnMs4FbOaAaUpEOl+ogIKqCTIgH3tCPnGIuh5Igh7G2gWmm3c5TXoHb6MOuvafeoulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boTCbJnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvYnkuP3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boTCbJnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvYnkuP3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3Bk7lX2436357
	for <soc@lists.linux.dev>; Wed, 3 Dec 2025 17:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yAL8VogV//K
	elnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=; b=boTCbJncTmkJz5Z05YGhH3tfyh4
	PFoPqhMzNKQW7Jr8kEq0S7a9FxV0rz5qyY6ewtXZHCVAi97ENyCrDdog39hCkbX2
	3QiNzLYU23yxTIaHmy6aQdxhgK2d12K6wbgMazkTLk9IY2Qndx8xR1AkssrhDIqe
	3yO3U4MmonorDK8ogIcCG1RCOwwhWOq1kWLsRVXBDcY8Z1zlHO1Ihts3dM87uaN3
	WfJ24PQHmV4xfKB+kYqpWglKtEwARIPYm1DMRAtPKprmsp11rlQnvjDoKrSsx+S1
	csdVQkiuEImnG/v4EXUfft6h5dT3H2rSeRHHCgD6RV3YCdkRNZRvAfE5ujA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmd947m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 03 Dec 2025 17:59:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so2313285a.0
        for <soc@lists.linux.dev>; Wed, 03 Dec 2025 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784791; x=1765389591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=fvYnkuP3n49oPdC2bM3XT8i02QUheilNDpVeaflsgB7cVNx3RAJZFf2q9OmdRxZktB
         jDVdJVba6V2Ar4+yZr7nFtK7Fkxox1lWpgZkbnXMnTdwCEE89xGcq2XY9iONgKUUd7bM
         BD0wVqvFx9O3l1XfyVWpjJpajOuoLI0VIgGRFdmx8FCz6NgXgn7+Nm3CF1KCLhSbo0LZ
         pAsdGw3cdz1v4wnMWbHuXyYpjDCpVZGp0Cr8g64XI06e03UOCnifIWZfAmm6lwGgKj1i
         74vYRJhwciJhfF6vGZkkZk3escvwCPenXXDFUDBovocmMNNEqftb5DN3PbXG8B+9DRz9
         /EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784791; x=1765389591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=E3FEeTjCc4QdPv1oPqhewqjRmarqdGKFnC/3gXkDuGc1p1AYe6SV9c7kxZqPyGwjra
         marXtr9RY1WlKtqXwKmU9iw49jLBuww8kKWl2ZMv+ySm1mTkDIjIyNPMU4gAXUF8K6nS
         WZ4vN8EAW6/sNkRGAP6wi+DBrhgTFyM1Y5qvvL3F8PJEjx5eAH0L4eMX7Nuwj5UCz9/T
         tO3Jt+sW5A9HAR5jAK7kZNplXPyBiU+h3usodZhGN7aSk1qhkCkanzLAYihsivbfbV//
         hk7fTCyPRggC/L/IFsDgV1EnQ8leCAR6r3TZ68KKooFXwHU4REdo+Q5fN9oGXZqNp7AH
         HElA==
X-Forwarded-Encrypted: i=1; AJvYcCX+nXSaKcSqc44cjYCT6laqsay3GASaFFyTV05N1UWAhEJy46guMerJ2ZM62iz1i0LV/+s=@lists.linux.dev
X-Gm-Message-State: AOJu0YysItzlPrp8mBaTxs4aKFN6/sDuCRtUTfQ6RjuHPRU/p7e6yV2J
	+GP6RILTShQyAcBlGtEmGpdjSmYQ9Haxk7F7RKzfpgdUnm30bS/RtMY5p8ivlXN7vLkJbaphDtT
	rH7jW2RywE/mjarjiL0h63Tg57+4emL6HGk82t+PpEOjYR0J0yUTvfwA=
X-Gm-Gg: ASbGncsRaBaAp9dxaBUtrB19tzfW1Zklhp2rUps66gqYQOhMQxc1J4ALEYwmORahvUX
	gQcr36KQ7nwXuB7J3w6UQcyh3elK4UViwMkpcEQMfRyg+mzJi+JnvDgFbG/q8HQQmNk6dJd5Q8X
	TZ4z/NpB0VyStfCTtioodXhbwdJNScTx5CQMGMCoPSxT/rq4pn8RKgrDT+po7IWyIFoo31VQ9i0
	KWeKQuPNQxp1GxC3lPmmAFle+WsJSsL9DSQBvi07UpkrxEHG7gTY/Eqn759dhKPDk1JJa+Ko2Kx
	OsAjKUA4m3f2It+WE9kWujm+Q6B0dF8kBvitBsOWfQFz804KlPiM9XfUjz5fI5klYi8OU1TAyb6
	w1OniZuDXObYlzGL8bveOEpK+Ng==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403589985a.30.1764784790542;
        Wed, 03 Dec 2025 09:59:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMqNQEARbZr9/oK6MMzo9BUY+5vFbT++kUu/tsZ7SRGCq15kGWqxGZNGHCNhXZ7PjMLuDsvg==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403586985a.30.1764784789940;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: samsung: fixes for v6.19
Date: Wed,  3 Dec 2025 18:59:43 +0100
Message-ID: <20251203175942.296554-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m+NCASzHGv8zbwfQcRW8e9SM38FnXWv5JTQtDseDbCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqPNP34dvI557Hyptu6xyKt0sX8hkxyVjedE
 Odd1itsAv6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jwAKCRDBN2bmhouD
 1yW1D/9IbiKc33R5Dh8VWT+9Pmo5NLig72GQbFRrfnt5zSv7alB/TSPA+FeC/MT+XwoA1NlCbRC
 vyuXHeeCYjl+93h7eztnSsHgHf4wqnykc0c6sCR72k47nYp0NK2ZZKqSkhi2RE6h+4GAvetpk3O
 EA8i70AO/gqMf8MBiZXieuOHIhTpgpN5HH/4qOVIZFjHCtRrGoUJnTRPltNflwKUmICW4L0RsQd
 4SawfPw3t2Be/7P4zbtfylAqEWILfFkXICqWQtVev8LVMyivcvDGv5Fqh/zBMLnnffqkElMH+h/
 UQz6I6x+1IlARp3nzKj/dKQuTyeBM9RA8l7CNfjhEIFVrwzSOTfkpl8JSyWlKh/lhi7i61jfyYY
 /N2o5DnDkgQYWT7l9adqxEmzWcyc/1GPSPAS4+RD+rOC1PiJkhik5dq9P8d3VhY+UlsdX+I55KZ
 dF5cum3CmfO4UQAzTaWZMkbda9TGVuzoS3kQJcmeMT+x+ZJ5dmv0xWQyVYccKNIikdDIneVHELE
 Ap47Zm7gTOi3FTX+WUmgur/PsCfDRhWZxK2p/BaiuVRTi/ZWIITMXkjaDxpfVR/21afDzhTxU4Q
 oewr+T255Cpc31MofCF3I2+gltpyXKqx5/t+eTbYWsDSxf1/8r6Ynnrcoa6qsE2uiTG7afYjw4S oL9ES9x+xhWZkUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pzpHd61V8NXxwfMWvCTg7iV5D6ps4mfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX5FySK2Hd2IaV
 y0n06/bH6hK8WE7DWw5HYefOMGsCbU5sNOC/Wv3tg85/uERci69MEXA1TGFrmeiqUz1hibOJaXk
 yI0SkCybAZcaTejA9x9Fz/XwAOXtESlDUT0TZlACqU6A9VMxS77NsXNS9ZH1X6rYrdkKzl6dO5x
 EFXP2pL7RA8/WOQM2OPUM0nl7GuH7qo0Y3HnkyVDGoETeobX3f5LTyMQCZpKai63V+QB0OIyOi+
 NU5FNuvFmu/kXTLEBtsOXsxHLiAJL4SaVgPA8BJ+kL2oEl69TExIzWkSzXkPZcas56OfxpbhuJE
 NGWuJlnU6iJBW3OJOIC2i9D7SNjh/9RGR/hUs5+HpS8j7rPQ7N8kGpubvshfrdOVeaY5RD3rSFG
 lZchxnmDBgwQKnR28TDjImSq0nrymg==
X-Proofpoint-ORIG-GUID: pzpHd61V8NXxwfMWvCTg7iV5D6ps4mfd
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69307a97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NxKsXlmia2VYF-03mHgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030142

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Non-critical DT fixes, broken since v6.14 by a change in brcmfmac driver, but
we noticed only recently.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.19

for you to fetch changes up to 2ff147fdfa99b8cbb8c2833e685fde7c42580ae6:

  ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend (2025-11-27 16:07:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.19

Fix WiFi on Exynos4210 and Exynos4412 boards with Broadcom chip after
system suspend and resume, by using cap-power-off-card to power off the
WiFi during suspend.

----------------------------------------------------------------
Marek Szyprowski (4):
      ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 1 +
 4 files changed, 4 insertions(+)
