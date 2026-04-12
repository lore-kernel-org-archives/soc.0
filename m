Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A95F2BDC16
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010882; cv=none; b=gyrsspn0LzTbus8D0Bw41h8ljmWPY+f3+lnX+vSfT+Tx4TTej56DdeFbwWip9/z3d/eHMqeo+zbBcb24/InMx0ExI6j8B4RljLRM3xWmRKXy9AMQCCIzN2cHQq81ed4HZeUc2dByue1Nx+8yTQjCYFM4eBhS4UzgEAtQcb91D/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010882; c=relaxed/simple;
	bh=bQ+zUzzbMGJ1KdwdPcm7KPnoiDcPjH4CEbd8yVzeEec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iPmbluceOkaFXSuVY8khZoXjvhdKPhwmxHWjemzstBscXqJXJuFa6LoUoh9Gm2t5TUZdpdYqwypuZas3WDZkRShV6qow4WXrrNLAFe0mQMdFeU5ZF6KigT2CiBLMMoZaNA7PMH1K3tgoDGWjPVteaqhLvHRNkpuaWgFeLDxf35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1HPuz3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXIkuCI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1HPuz3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXIkuCI+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4gQZ439818
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sXti8VrOTViLTFMO1s48Yw
	Mgytzp5Ygon3ChdIV1l04=; b=D1HPuz3QHfy+G8xwit2dE0OCp8kHuPV2MVf2lY
	kE6epkPtOftWdg+EjISqHvoKa/YAHalATXMmxRR55V6/+1oq98qiTYr0dr50Fx7A
	UHfctaATdKv28/OInW9UZnJg0Z9pLtmiTiFd2BgiZhUW+seWde3fAdgXbv8du+rQ
	Jh7QzBnkIeolbYMRE8tCCcQkk4Zc5twJ2RVAT5VXpgMjt4Z2lau2Pia59bSjhlPc
	DtAip9Wwq2yimqqEno2908dsSzNzr/Xc+ox8YOrrJIj2j269r8+fIU3vjMGSrWkt
	p3N+3KJ+DcQRcCwOLhD2zOq0DeQifNwQTrj+0fNH4gz7aggQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtjngb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso64136011cf.2
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010879; x=1776615679; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXti8VrOTViLTFMO1s48YwMgytzp5Ygon3ChdIV1l04=;
        b=BXIkuCI+dDVBmRjcaHei0Y3bICjdzIiG0JC4wGKptCX+YTCpLcKt5BVltJC4ZrM4Zl
         bo3yZFzsOjoBNgYthgrg/3gxRoXfFzU4Wtx6WvmADr+totQ/cknP6oi3rOUgcyP3QnfE
         OEe2W5iGt2ZzOU/83370IyvZJbLZSkvpaiG2TvQNYHlg0Dybvscz+yTsHWzxBVYoNml/
         KekNdBGTtdwuyEMVsfBZVKonQsXqP8PhcMrt9iAVoxxbJNgsYTzuegd7h/UcQJ48oI/u
         9bVDNK1Y0jdLQQ807pOWEcLsj5fkxTka1Be9KFVXeagNdRNy9ttzal537PHhz9UtpXrH
         rPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010879; x=1776615679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXti8VrOTViLTFMO1s48YwMgytzp5Ygon3ChdIV1l04=;
        b=r7PDlDvnliXPouc0eM3JcqGwfnzQ1m49hSm3PxTIl1d0BfQjumhUjZAjcQTG9TBnxQ
         STYmSDlrcH+Zb5nCnzKKFmX5NUEVn31MfnKFLAsA2CHbHI5fUOFIKUOulKjjThirwCTb
         OT8Y7QZVg5UeggsxScEiXGeAIkefffJR1xUWHR3btDp7tE3vjRlPlSlKL9uDr/GQVz6U
         Kl0kuEVjOPneXvrr9y9ayUqZirbNZdxCTEzabQvJfrW3qHZ3Oo6oGCcSAIVHVlk0iqsQ
         iwUM1SzjnQlXVYF4cvSrnhwUPnOfmPoNapjQus25E/zSugm7wHEQFF5MBcs6Su9DPm10
         HiFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0IwC9nx0rs5kez1SacXFWIjpDJ4eqjbK7LQI4K9ifc9q5k31TotuzxLemzSTuNh9HrPw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJd/oX872aBOlBAMiNFCnZ5CHXCawfnDutRnLg84tlIhAjuJ3f
	micVH/cg54m8E6t+iZuD9vrq6va8oFvpUie8Z9lwQEMbHWtON1VmfVd5iQPMZ5RbnkhkDVB3BXJ
	0KCZrqD4PxiR7Gc90rPV9LTrZkLJiE2KsRHJAdPt+87PGcOYmBFtNPEs=
X-Gm-Gg: AeBDievDjLlbXbff/XGbtRrHs1UFttp8xJPBG5+o09NrrvA+M6ZkYegby2iJGZw4NkO
	o5QooiVb56QVXE1oqXvWtfCgc0h5kTqWYHM9FtMAd/uQ6zqwzp03PrlRkvzOUL+G+M4DPjioG0P
	90h3EO4UOdTthvX9VLZaU0mKV033Nh3w4l054a34jFO/YjqtYD7Y75O5ETrjVq9Pp/wiPPWiE28
	5bjmfkX1+1xSd8vcfsZSD06RgHQf/UzoJChFZoCgukyd5P3VuN96oraj2SxNS6Wd/Eoa88VjJYQ
	3tILFOXBPDFB/mF2P7PuO9O0/OXikM03w7DR/K80ejOiQly+u1Nxq7hD3PROJa+NDPa+K7B3J3F
	0BQBqK9Md0D4Q9ue6eGCwhRSnEZcoC6zMVMZCHQGYW3XE
X-Received: by 2002:a05:622a:1b12:b0:50d:7f60:621f with SMTP id d75a77b69052e-50dd5b7b590mr153597181cf.29.1776010879581;
        Sun, 12 Apr 2026 09:21:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1b12:b0:50d:7f60:621f with SMTP id d75a77b69052e-50dd5b7b590mr153596851cf.29.1776010879103;
        Sun, 12 Apr 2026 09:21:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: defconfig: Cleanup and change Ethernet drivers
Date: Sun, 12 Apr 2026 18:21:02 +0200
Message-Id: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7G22kC/yXMTQqAIBBA4avErBPSfsSuEi1Sx5oWFloRRHfPa
 vnB410QMRBGaLMLAh4UafEJPM/ATIMfkZFNBlGIpqi4YBadWbyjkelaonRK16WqIPVrQEfn9+r
 633HXM5rtHcB9P9bHZCJtAAAA
X-Change-ID: 20260412-defconfig-b57e7f9b5394
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bQ+zUzzbMGJ1KdwdPcm7KPnoiDcPjH4CEbd8yVzeEec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Zze/36s8jGtr3si9JM5P/cHBO79Ku0FW4wu
 dOtvuUxQjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGcwAKCRDBN2bmhouD
 18uzD/9Nf+1gdApkTG4M9+c1DnRQw3OIRp8qebDPW5/9/+KYYpH0+51VdMK9NJUI+MS52cg/B0F
 Ef0RJ3qKFxm/PjC/VSfb9ILpjjqjLHjs40jBnQwIYT40KKLlgeP0JsJCeL0VckY44Yv3tdKxSLu
 phE1Di2rCEV2TAJr5ynmaQ6YrUIuHuHlVICZ7700Eqh6igSEyW5iyPcKjurCwVVkx6Ra0xsqFuC
 K5WZdSdyAQ3+s3lBmaO/xcNNc36uxzS7y0sTlbN3xyJ1EAKgIXgNBZUNNjyaPduz0YOOCB8Yzwj
 wayhAHAouAxJA7TLFSW79o3AKzKIvQwyuh58Tp+EgIgkFqL/dYbsYWDvk5sIoMTnVPUPaLE+57Z
 lHNdZZPIn+O80/XLIV8JVoWvN4D1Uh+f6Xj3uhA9Xdgh1fMcJoTVZ+YrPjUGwS58nL8hvF/i3T3
 y/RwMzqV+fm0CVZ5SLx5IqRLxwsuFL3FswONB+SvORKOMUnHE9I31ayCq7m3xK023qqONZNWYh9
 BJAI4ndlJx/QY1MHESuVfROCY8tf72tdoFmnZOH/xO8qR5l/62lNNS9lZbdPmKU7PGOmLyvpj+Q
 /99V1j0k4lJFkPQ2IUBuO5biIsPzCxdhQBjiBj89cGQ/iWnlOh7NnoKI0asrPunKDCBb7P3Lq2y
 Nfv3W+0g8J7nxlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dbc680 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zAhwAz0-9tGWcaRmco4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kJ9jwl5vzR5nLHcQjeCTKerJhGuvIadm
X-Proofpoint-ORIG-GUID: kJ9jwl5vzR5nLHcQjeCTKerJhGuvIadm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfXy5Uv+Og2H8i3
 8U0XzqGjZTX6CgROHtN03Fmx2ZwZtLelfgy9mBGJM2ej3YI2Yv8wPVyc4z56b9L6dx0SAhrsJz+
 NnGA+Syqu5IExpt4OAPGU53qEu+oE+sBtvAOuA98+4BJW2pVNFIymAKrnR+PxoSNgeDZZqElIAN
 oELFiShqgQBZ+yPCx21kU40giO9fASpnlwG6hHfvoXFJnhEuiDc4bMa6de/uNkejD0j7kuejC7J
 WQmlYLP+hHLHBl1oz9ica2vphaTEoiAD4h7e99Dr967Sj4SF+sSB4Wn4M/K5klrAiZSLoDs2bNn
 Z1iWwZlP3yB7m74y53CHieyDs9uexmM8XY908KndN0urTegAc+VLRfSTAa0QIrm3VQTZZwzhyJN
 kcgKfnlx03HUluZGiX3WV2x1d5kI54SJwRchQN8fr6S/65Iz4UZFR+vbt8NCHROC8qPGkIypv0Y
 mH+Tb4JEKXgOI/p6EGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120159

Several first commits have no functional impact.  The last two might
have.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Drop AMD XGBE Ethernet driver
      arm64: defconfig: Switch Ethernet drivers to modules

 arch/arm64/configs/defconfig | 371 +++++++++++++++++++++++--------------------
 1 file changed, 195 insertions(+), 176 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-defconfig-b57e7f9b5394

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

