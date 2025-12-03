Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26782FF67E
	for <soc@lists.linux.dev>; Wed,  3 Dec 2025 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785384; cv=none; b=Iy09X1qffdNtQY1PiHkrK8S7GHrB9Aio5vFgIPKmCClM0oqfULi+d+riXLny9wT0HLE++sCXQhUplaslmUM943NxplJwb0aB1p2OmWBJEF/DYFsmeaEv2uU4JRa2Ag6PRfWohKNZ0OJCEuKAwDNTZQcdubaYPYlgCf78t0vo5lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785384; c=relaxed/simple;
	bh=2ooYuXW2EEg0Gh600UznJ2oGF7blDoe6Qje0LB7FtpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0rdKFtJJdXYdYumxAwUVSEHHk8gUWkZ/HHcqldPSURt8wsHmlCHJ3ryJNq2Q4Qqux6iQFLJQ1VaNUI/OHCERlHXPy7rpG/3CCAsF9HEGEcWFjxiABddV2hXdexy7F6/rxMYvHDoVLTRZ1LzKlvFko4NedrpHXNdvnRUiHCVnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdVEwHlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDLFXXjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdVEwHlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDLFXXjP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3BkDKg2436499
	for <soc@lists.linux.dev>; Wed, 3 Dec 2025 17:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplh
	MSVyrzKo=; b=hdVEwHlSU9+PVg6RP0EyVa+JR3rNWGftQdDd/3zjv63xijWkW7n
	HdtEcVL6LB/PFlxgKecDVbBa+fL9WOJ3LHKGmV6B9cSuBJf/gRn5qwRO7P4rOq2y
	a3sS2fLUmtmNnFgHQWaWeDVJgxgBezKLBuhIbSse8W8lb4toE6UOOCQ3jhmGZ1N2
	nEVPCWHWvrhyJZ054ZeWBi5aWzN8agxhzNW9w/qB6QVgvTmNeIaSxKXU9KpmTi3z
	Sgo3GHnsTNGC3gcspbJ8AQIWSSTaKbjCDvTXh3P3+NLHAA6BB2f71LVMDX66OB5F
	ups9yUqH2eS5Zf4bUqr5ZFOphcz94mWY9bA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmd947j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 03 Dec 2025 17:59:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e235d4d2so1121855385a.3
        for <soc@lists.linux.dev>; Wed, 03 Dec 2025 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784789; x=1765389589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=HDLFXXjPpQaT13h0gPHwHbCCUsBZoB/31pxsWevInFcgM+DcxDk63+6F/nzo+7xNDX
         zN9VesVESbQT9s3v3Nz1XHFXEzKXfsAVkVeMRgOiyIhR+8Q7IADCTUJ87wm57VVV9DEM
         GCK+Vxu7QTtuf4hMe4T6GeQtTG1GqXwIhsaeEmzFGfBbkD8gpGjqAGTfm5D5KI97/w9y
         x5fhwqvyG6Zm5lO5u3WWnwtmuCwl2/4t/aYA4tLP0lvdNPOoFec1+PRe0aWzVqjDib/D
         ZDO3FoQnyjDMkY8N2XGfD3H+2AvH4WuWsqRwHBfbs7UOqh+9qhK9w6vab2b2tHDV8vGC
         RalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784789; x=1765389589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=BDwBE6wQxWv883AUENItozDBWEBCYfaZXyCUnFZM2gV7PQhiS57/NjbcHa9jGuqvh6
         hrLEm/Un3Ni3R2EzdrvXOA+uSf1LkITm1yH3x9jWEoQ0UN2WYEbFdT9PbRD5irZ73D+w
         /y6OBhN5fk99OoxPKPwj2rHEfPoYkaM91BN0yx1t6ch5HXuLXMxFOV3Mc5UZO5vadtmI
         R8OBbXZkYq0HDIqcQ6x7SMRxGEX3hONpMcyy6qtYSQoL5uNgQ/8q+90HFIMYJn1AV+TO
         FEsKRJbec7pcnxXwJPJQA2x888owzVZrp3OsImISs5lsBkGhOv0ygJHls+DW+ZyLiv8v
         oliA==
X-Forwarded-Encrypted: i=1; AJvYcCWWssITs3ij6TXzC68S/f0y2OTNKYUWSRNJgYfhxWB+Brlzvrezl76Cn6/HdduOoX72PxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Gd25NrUy/0CIrHq+GV43o3bA8ViE1qz72FZiolApe9q+5SQ1
	lRyl/3yZefG1pL2SYzs+v4f7y8lKjwt1qpHTQjcnqsAQLIJzjLQDuW1SXVzRrjhqfcP4Ibc6OZt
	+D8Cn8l6LDeFS3s1Y/R0xAjmuLinxLmxnP3MEZ/srY/NJNpm5Gf0nD5g=
X-Gm-Gg: ASbGncsyQkNGM61swPkxbQWMunEnry0aIaT5B3imzJ+Q6IXAZdn6XUvy7nnMBlxmwhH
	kW1IVH+DLTexWHG//fJjBofMF4uJQ9KXa44BZL1mCeLa/a2q9zfBxUczrzv+GofBeBK7aJAtXTj
	9nU76/qvUoUo8Spx5A4goxiy0IKnD026VQeUbWBv0PvLrIsF2aieC330+l5M0fdp8YJLD7kjDqW
	YjVzK2RIBK0eMm78lUli0K03xdoYy9XZVWnjXEcpGVXk2hz2pXSVE9j51ze0GQlT9VDjvkRaLDo
	QO8wVdz1BDSor5e1IEw9LKnZR+ulwcf1yIocrZ1iwfENjcUHfpM20DosgCyk3JlEr2LzI1zaVc8
	0nYgZashWd3dnfsg4s7wZmXxkRA==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462805885a.37.1764784789308;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8yCiwktBCyzrwBa+KnVsA4n9L5lmxOOSzRd+h3w1NjUHwMZOWIoUMSZ3WspaThXBEBWKrbA==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462801185a.37.1764784788755;
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] samsung: drivers: second late for v6.19
Date: Wed,  3 Dec 2025 18:59:42 +0100
Message-ID: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fu4Hi/WfIMo2rfWLyC73B8C3fZMMk7cwdUGFfSUsWvw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqOfAZzaHRmIY77uLC1yV1FKmzMk1E/y3ggh
 IkPPQ8GXTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jgAKCRDBN2bmhouD
 11vkEACHyrGt7dVfCAqtf5VUyVStg0GjUNrYTlUnoFRd7h/NNsKt4ZT3EzAXtiXyeAR+aUUzb54
 yCkjaXwRJov/dMaxXyinFcOJtsBGuBuu8AtJB7XZnaP2VXaREE5bcwrHtEuBmmfjE//GFACHG23
 IgVQtND2c2o2xsm4U++bkR5tLC+L3UZIMtnbaSNeRafOfQPTerr6OTQy0uqITQKcy9XZNAPMgiT
 0BBrI4JkOSI/u19OskOjHHjA9dlS+bi3jnicIQX8z4dPyo+fAaS2xRmNQK20G254/6CU0DXK9IN
 PcIbCl9QEJqYfSFtn52NEkhuSQ2psY2HClZ9kQa0bELa+8spg8Xg+v+8V2igaEbwvkNF2kYOz9d
 FuEDizS5Pk22xud6Rr3iqMj14yOe6qo2DblRcTGGkGj0mM72A1k9na9SbUYxnAwYObY6d6OkH4A
 8dzuyV1lQKaoJtMJpBLs0nGPVcNAy/STstJJFoS3xNePKg6b0SJixMP7V5h0lqlKB7oCJMtOydq
 ZO3D9l6+aHLuMvqbE9G/Ldv5eNE7m/NmReQ3v1N1rIgglQgF8E8mD3KdDJRwOIWO+vf3zqMsRKa
 Uby15/w4cFdR4K9hhAhkhPMilkwREXAsa8MqkHp3xUuq/kpu+ITxjDwOD/Z634gxlgoSycIKtHb fvTZSnx1HsJCHsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WBeZwahpp7c__9P7ew9O9wVQrux11BGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX3JFrOv6zR0q4
 P5e9zEgEbOo0j2G4JfPz60UwTxbApoeF7+ERiaxWNXIcCCCRpbuR68YXptzJ1yCwPEQyYmDpyT7
 xVSQd/vX0xyzJXt9+0fnJtmk1/pNMYyBQf5Fnr4HiIsDnKGu4WHdWUQbS90u4aEYdFHvCAx3eku
 z+283h4kGjmYSUsSvWhsEKh2cddQaITD4p1EUTMVKYAY4+HOPZ9V9q+ICU1RZh4rqedahzYobmX
 CUXS75/C10SyyvsnrFifsf8i0EobPY4JGypxzXe2vCDyINuFdaMguyDoYhZpKeksMWKTl2TUnrk
 Iqeg13cRoU8EMMp2v+CMarsImUkueEtJVDP7fAjsmysG3ByqVzSUzlQk6/kf2Vp4MvMpeNgYI1s
 ac+e47veU5BEtgP8gaOvHmXktFfqZg==
X-Proofpoint-ORIG-GUID: WBeZwahpp7c__9P7ew9O9wVQrux11BGh
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69307a96 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t9IKhzsu_K_-cmMu5D8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
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

Second drivers pull, but rebased on master/6.18-rc1, with late fixes.  Would be
nice if these go to v6.19.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19-2-late

for you to fetch changes up to 990eb9a8eb4540ab90c7b34bb07b87ff13881cad:

  soc: samsung: exynos-pmu: fix device leak on regmap lookup (2025-11-27 16:55:38 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19, part two

Two fixes for Exynos PMU (Power Management Unit) driver:

1. Silence lockdep warning being actually a false positive, but quite
   disturbing during testing.  Issue was introduced in v6.18.

2. Drop device refcount when requesting device regmap with
   exynos_get_pmu_regmap_by_phandle().  Issue was introduced much
   earlier (around v6.9), with code being rewritten in between.

----------------------------------------------------------------
Johan Hovold (1):
      soc: samsung: exynos-pmu: fix device leak on regmap lookup

Marek Szyprowski (1):
      soc: samsung: exynos-pmu: Fix structure initialization

 drivers/soc/samsung/exynos-pmu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
