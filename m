Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B632F8EA1
	for <soc@lists.linux.dev>; Thu,  6 Aug 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022488; cv=pass; b=Yk4BUSuXWfxiPxs1urHNhASE3K2x8f4t8DYh8w7tuLSt1u/yuVxfHG738O8PImep4MkoYYoz6msP0m5X7J+oGj2BRatAqvYCZzYFVpyAfuTo3QpjQzNzcknC9Dz8v9hPd/5p/PYV1Am1vAkOKLopGPHeZ1lpelpEyaxPGA3WCjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022488; c=relaxed/simple;
	bh=NCFE1L05utdfjtGpwi7EaxIjgpECWl5skZwwzBhwbaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyoLLJpiPv6HutDE7PMou500272YFPIMnptVbOyQEn1lbTX7ndyi87dVxS6mMoUDRqO1h0l02slMdSDe18SNEsPRn633xOwN3jUj1XqsyYqodY/rv/pWWTAWsjQeH1kfZ62cMwMDoxraKOznlzc/R3UBAFL8jXDltTif0KFe9Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7+e2XPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLndQVBL; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7+e2XPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLndQVBL"
Received: by smtp.kernel.org (Postfix)
	id 1892E1F00A3A; Thu,  6 Aug 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786022480;
	b=W6EwX0jbZvfrd3xMeH+4yxUaYPBCE9QHmG+VPbC0xbJGaFo0bvviJn2Izgk6T9aiP++g
	 5M5QQssi3/dImz/vRxqc54yuNe4MENoc426CD7GQCFyK9ZIUEOLV5CdCF4BjqeWQn63zg
	 +FJRbSf437BeAtUJlnRGNl1sJ0/oI2UqDwWvkGdaO/B1mkxlosJIVCFR11cW47wRIAxM2
	 lscRStX3w7H3e5+5doEuCHpGH4TiE54uMRxQ/Yv1cjL5FxbXeptWclsvdhDKvAkGbzWul
	 J0NoUVePhw79nNO7JP+RvUy3G/7sQmlOlGPduqmlMHZzhn2Wg1J6N65iyt3ruPVUO4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786022480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PPSac8z4zvvOslaoh9M70wg675Jov8kOialTXHEgSxU=;
	b=ELx7LnMTbKIIgwvmALrljfNE8eWlpJn/KGvGItsm6GuvgdUVkv+B8+kVkbuP3cr26WCq
	 qYH0i70iprUmVSBHGso5bwBcZetzyPkny1mQ/P4Q/oSkDT/RyHJxOlgkWz7LT5q9dagDJ
	 cgLwTiXOvbHgSTFUvyhS34Fxh8KRWA4/tjndF+RK2ArlIglM8bL3ap2fH52o95qgtQ1Dk
	 NJ4oTtZFJUJzQPYjWm6oDpDxchvFR3+psnrigENLbKs/3JSEgLtPYL8EPmcwh6n10eqkF
	 UX770gJoJWR4YBmQIRuUdDD8Az9iDnLAkjCcSFXQRU/GCAUie8OxFQtpnqomSZqeV3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7+e2XPp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLndQVBL;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 676491F000E9
	for <soc@kernel.org>; Thu,  6 Aug 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7+e2XPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLndQVBL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 676491F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ngPj1228126
	for <soc@kernel.org>; Thu, 6 Aug 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PPSac8z4zvvOslaoh9M70w
	g675Jov8kOialTXHEgSxU=; b=T7+e2XPpben0wmsot9mtnftuofDIknP6PJX9Zd
	XEncXSKKq0Najtk8VJFkbnGHD4A6knNY4e4DKOt8ko6hKggVx9r3cAdT9SnVnsqq
	kCAer740k3D3vtqxXGIEaFJ5m2cd+NPEHRN2pi+lHPgQHxBcI2gjHG+NV5LVRimd
	YDHAgL4Gluc83hcoiUIWc1Dz3yBoyNQv+yFJTJn3thzqrR4/zdgnkxUaG+rRFw1J
	2O2h7fbSAREPtcofI85uKbjjNMUlAasM43fZVRWD2TiTnWITGJd4Gync4VKh67Gu
	Dstlz8Du41BLjQW6vi3K8u5k1AOYSE4OMERjItTfF7adMmWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqduh58a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Thu, 06 Aug 2026 13:21:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4f6ac06aso34656401cf.1
        for <soc@kernel.org>; Thu, 06 Aug 2026 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022478; x=1786627278; darn=kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPSac8z4zvvOslaoh9M70wg675Jov8kOialTXHEgSxU=;
        b=eLndQVBL3a10NVGKbeQtFSmaB5PMcl0quEfPRPDzO4BOExvngogD3UaAOFCDzUbfrI
         lAiG9iPndGc9zUFDOcojkg0gyMsKl4u7Nm/jBPc2aTup9QfJn0CQw/Ryvs0hyn0dRmiw
         AB1pg0ZPSfjrT/rtbe/5nUNIWofZUSleU+MozugYXOCehY/WSicm6GKdxoLyqUCuQN4J
         OY/FT5FGTzytRXvppmbTYFXzd9GhE+k7B4ALAOz4JVukO5Fa+zvupaYDFyRhq7MvoRcK
         bQFYFiHZZ3RsjeOzr+NH+Yw9JEHpfRqSdxJfNPCutrhtq6nXXnqsg05Dyp3yB827LXkc
         8UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022478; x=1786627278;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPSac8z4zvvOslaoh9M70wg675Jov8kOialTXHEgSxU=;
        b=lxHgF84cDBFcBHDr7LoI0apkjfi+iYq3RtceAC3yFocam5Lt2hkSr4sLpYoZ7ShjO0
         yrkeLyfXdvhXYlC5xIvQd+IO0zgSscSudJ+WWl9vKv9KnM5uSgZFi8RPmiqsxvWnnV1L
         S5BA0dwWavP5cbKp7oWRG6f7fd+b/2xDrlGBj0rJD2hiVGowpz1IybU77IwmsE3Fi8eL
         68+ajxV7Y4Q2evS0OkTVeoieKf43zyWpyIgBrtjAbtcv7hITakYYkZyQnsqg7dUNTTWl
         Y4Tr6WvBOjFjHM5tYZnO12Z0ziA2TsBA5Aqwip83MoSB5SwbKVviLegabO5XJy2tMT8E
         wnrA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg259kd7K0lEwd/UbDtnRn35cUsoUAZmutFEV1oW1CNVZyRHfDG1AEKWuXWeCfeJZbMjo=@kernel.org
X-Gm-Message-State: AOJu0Yz1oiGhyxmBrIR6FtEbFIAzeEipPDpTCH/yaQyrw7WPr1L6Sxc4
	Ep1UW5zji/VO7X3yBPu4QEQxK/TLUxOludkXZupj8JgtCGoQcK9x5/j3OC4d7CeSsJo8K7pWwdU
	8cwdZP4dtWSaTUFH7OhX3Daq97cVHpaEmvEQ1BT3of6GeUGTE
X-Gm-Gg: AR+sD13gYAw3wpIMO3rvjYkTkeLZn4lCteP1jMhg9spjHvC3VDzVnX8CqwJ6Kt+X3Jx
	Har4FKcCJxz0TiccgymKGc7phiRY6OPTfZ21r7dZuXhZmO5PhCKY9H7xa0joaIJkWWxv4FnpeBE
	ydMPbPcx86sGP2ZiXaJtWJjGY8gXf0yS5GqOx3/PdCdJDcxDjLjfkDW6BW07ZdbnTCTx8pvXfqr
	Fp+I/MH9Ddauzh30o80jahwDTOGwRoswHvRkEu1Z6ZzKmegBzBLZ1T01hn19NwhelWrNy5y7PYN
	qAfH1icdmk7r7QI3LuuPQRaDDrWD6KcgHD4lLoy/DwZ3XhB4pjBPm5HDiS3YUEp0WCAnLLxADEq
	fzZFsnQBdnPucpoYtwuIsyp/MlsN6jNoghx7zRXuOOgenWA==
X-Received: by 2002:a05:622a:a10:b0:51c:a9a:b0ed with SMTP id d75a77b69052e-52d0b191dccmr16339371cf.26.1786022477682;
        Thu, 06 Aug 2026 06:21:17 -0700 (PDT)
X-Received: by 2002:a05:622a:a10:b0:51c:a9a:b0ed with SMTP id d75a77b69052e-52d0b191dccmr16338761cf.26.1786022477294;
        Thu, 06 Aug 2026 06:21:17 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203645c087sm244027266b.58.2026.08.06.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:21:16 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:21:14 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QCOMTEE update for v7.3
Message-ID: <20260806132114.GB673420@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GQILvGNFw44nkHuyhe2pOjkgxb9msre6
X-Proofpoint-ORIG-GUID: GQILvGNFw44nkHuyhe2pOjkgxb9msre6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNCBTYWx0ZWRfX7j7WyBaWzOBF
 rc86PMfivFYY8g+1UjmfG/sLgDqlbFQOqHpVdmkeG/b15bHnhqcF9ogF/HiYm9HuR/X4dP6Hemz
 EzI/I8S7ZCaDdimt5V3GX14odbS0WuNg7btfc0DX9RxrXw5GSO/iKea8/hVc8dbzOs85pHE5PlZ
 3e37kR5d0IAe4Y3DFWBxmTIRKBPDJDmrpTsE0WhZk6FV59p+0/3HExr4YXNTSp5bILIplKKpOB3
 QIs0FYJakncV5tqyfuu1wYe6ldsY7yojIJkbYgSxbn0IbYia6eqD37lX5TtUsXqeQlo8IcnBDbH
 yakwQGDmSJ8d3GRTP0YCbGkn+Q6pA1gt3x9uocxc1My3/wh7ezH+qxX/0W66qJPGsqnDhgfoGvL
 OovgeoDt7JZ/qhEO3NVzHJwk1IyaTm1Dh9cq5eL02cJVC7XKmivqv8Ohz+3RG7mm3XmDkAzTQOO
 h8/QjedI7YhUy4Uwoeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNCBTYWx0ZWRfX3bKgMU9qS7Vj
 H1HavOi139QCNriSI9mYIY5D0sFSd+OxaAi6phrVBQ/qKfDKUb94rVvn8YLjjzJ8CfxXF6oYj+r
 ixVL4lnuUQYfyoagsNpMKRW+Cvhl9c4=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a748a4e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Oq0JbnJb5wmJE1LcQasA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060104

Hello soc maintainers,

Please pull this small update for the QCOMTEE driver.

Thanks,
Jens


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-for-v7.3

for you to fetch changes up to d92f87f3e7c79f58cc6d6edad4bf1c96f795aa7b:

  tee: qcomtee: Drop unused assignment of platform_device_id driver data (2026-06-29 07:53:26 +0200)

----------------------------------------------------------------
Drop unused assignment of platform_device_id driver data

----------------------------------------------------------------
Uwe Kleine-König (The Capable Hub) (1):
      tee: qcomtee: Drop unused assignment of platform_device_id driver data

 drivers/tee/qcomtee/call.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
