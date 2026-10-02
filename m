Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF53328B71
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951092; cv=pass; b=MkMVfLeSnejRoDEgs9Q0+WpjvF/3/OHmp7zUZVB2W9wt3objdssnZtuleueysD5S9P+pxlsn6zT8R0nBBCDsnbLXm6gyzQGdMUHPJvgPjRP91nWcuceDeuUC0dH9jll9ZmgsMhHTmnyfHdLdflN5P32OUtbqWRHsQNud0jHLv1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951092; c=relaxed/simple;
	bh=g7FcE7gRQ5DvcafTEcDaKR+a2nLAMCLq+x2SfKEYHTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMJoL1E1VVYT0pJNhvSuzOlda9osk2eJXvwy9uCUa2DpeL8EnTSgmakkT7uQzMSTvuf17xQQzhFD7ZUx2VfOV3+HHZsUD4AGzqqEVvrIVyMHxqheCxXwJcvHsJEKXWdbe+pQ2NXE6GmGsfyguoIHJgn+insaHVwLZ1sFe/ZefVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6XSXM45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJN7i6SD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6XSXM45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJN7i6SD"
Received: by smtp.kernel.org (Postfix)
	id 3E1021F00893; Fri,  2 Oct 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790951091;
	b=BnK4YQtr1KvJJ6xUnbzeCaPzQuheMdHlRJyceazk03bRb+7Sh5U31rKqcF7NaElsv3MV
	 mV7qgUHEGoGgqsl7PoMb4zVHcxa0swUPAnDiFfv86kDMtImdUIDGCsEWhtMneEv7XsX6x
	 FEdfj+KR6jHreviWMioEDGwsFh1RAiUsCZBnpVLleI2ZXE56l5M1ZL24+KJEW8GokCMvG
	 KHOH5WG7tFZFMztrBhZR+Z0tUITe4z3wkKVTmwuLpS9VxHYKA6/GfB5QIHp/4imP+Wjl2
	 zZrSMX28egFkmxMr8y7euDTiF4wmKXW1QV45YQGILtONCfi0SIT+BgEJY+VtQ3dHevg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790951091;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=;
	b=D8RdI7DnKESyEDqEzxMAF9bj+QAWEfXVji6tXNZl43rQIlcKbJY4qbUMLFCZZxp1ncfr
	 XrN4tsfIbAQGl6LlwfAjnBWCyRXwxmPKXGcl6yiJTeQs9GB4DvkSNcbZLbW/KuXlgqAVb
	 bHM/aYnDJNjuwWr9HoqggPbqfSiCgUy7e27LRzZuiCL/7lFfUqqeId+XL/IvldjBs1KN1
	 NVMyft19BsCH9ARJGB+UA2Y5s73h40f5ALc7UUXEQm+oIBrzqh/9Ik78jBvZ24wnKRMpV
	 riTs0+MpAjLRqdRLf6y0GfnNl7CCsc0rF+PsivQzEuB63PZwKyLiCwen4uvafDn7Vfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6XSXM45;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJN7i6SD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97F871F00899
	for <soc@kernel.org>; Fri,  2 Oct 2026 14:24:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6XSXM45;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJN7i6SD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97F871F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692D9jeR159970
	for <soc@kernel.org>; Fri, 2 Oct 2026 14:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=; b=e6
	XSXM45GKfzstKyQHZvb4ezVUfM6Jp8RUFRQoj5e3FFZro6bZl2vrN5OWY0mp2cze
	CBRQqWf9wWRm2IjguKrZHtOsmPocE0LxMmZUTLMeQ4XB2PK7F7mqHlXyieifDfFt
	PxrwmyTLmBwNe76YioL5ClLSU603mbOhMMeu2qPV6oRPfOnRxA/9ALnNkInNkywg
	F3enl/54ZYpEiOAd/OqM7mlu/6YmV1seqgzGwRBEcIGfes97VIC30h6SGUd2sKPB
	ZLLJt01XvR8fu1Kr5ttjJTSQe0tzvaNO4/R9oE0ZaaOA71FGf7vEe3iQ3ttZ5bgV
	tZcmufXBSKR2XVNQs3sw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebh1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Fri, 02 Oct 2026 14:24:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a77961b860so1484330137.3
        for <soc@kernel.org>; Fri, 02 Oct 2026 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790951089; x=1791555889; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=;
        b=HJN7i6SD0v7zmYRMIF+xhB+gm5JCluhNqlA2J0GikENfYuBatsTxMW5eL4y/Dlkci8
         SndkgcL2N2Dr2GTENlHnlQxUzobQmqHurLfgpoBjsOxcEAX0CTEazvgdIGDv98qbV7QX
         D4Lw0zA4XCcFwfU7PAfIxvJWGd3Noz0AH+GDyRWX+G54EjqsCpLhaSpbQtL6eZSQ4nQp
         59n3u+17bGaHGxv7eBsYZ6WqZ34N230qUzR016PD/Pj9QCQcz/NQx2C2LKvxPMakh1Na
         kyQUrVRy9cnVdJQHJIsAwz3KHMLdiF3jSA1wBllAFkiWhhUh4qor04q2XQasJqVCAOaj
         ek6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951089; x=1791555889;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=;
        b=WdCS/z/l4clCtOny2rk9RQpmaoZv5dWT7jm65FCD+HVZUteHMw1lO6Fg3YVVmRwNQm
         fs80vbXT4sOfIEfG6r0DU3PgSozKqlW+RY0ymhz9IdRcc3tOOdy0fmLdSKaTUPJdNWx+
         Vifusj8R7bKSEisxa5aftR75Knc68NF8tqV4aNXL5ylpX67Mqd1UWVzBqZbD/M6je85v
         CCqFkiJQSTKESAhaOYMxZEN3aIhtZ8TCSLiTwJB12nLAF9hlZhSfsJM1hLx2PjS+GJAP
         /3t4gBV+t8avj3CfvE5Cq1q9ssH7h8a4NkaxVAeuwH+s02n947ZMpLcW0qUlEZxlGlpL
         utPA==
X-Forwarded-Encrypted: i=1; AKwUvBzagWYcGG7rpbrbVehUMSg4Fy4S2aJ8LYmnvWPhPzQl+fnOKDrU0in8+84SMhvBhRAwpJU=@kernel.org
X-Gm-Message-State: AFq9FYJQbPrJzh0B8rBED2k2DI8FY0vY3RoQi4SntK/7vjop7TcP41qz
	t9ha7XK6GRxopwJhmiW3NqW8SzHUJr1tjYStrORyung/k76y9Er2JShnj5obObt0Zt/MpCanM2c
	+m89ljqF5pHceXrh+UAq1hMd4g+RHSqcwbii0AuNBmhTx7ncd
X-Gm-Gg: AYBFou3LV9GZMase0zZxCP6/J6Fki4XLC7NmYuLn+hTCtIMIeaQYWBFTyM+OTM0SZ2x
	XL3IvPJzKRFxfMSSahXNQ0AN3IXv49f5z4zPeIPFcR6v1+RJmMxaVgdLokrTQwdXnYf6EVZCXo+
	ORNrJLWObd9u178SXF0A3esxcJp+Kl+dlr64NZSbNCpisEnRf3RC4dbJ4VC45RMVyh7MIqcvUAu
	bKS3a/t7ZJvJT3lm0cLvfnV7uKDKEDICjHyM59VFW/8+Ah5qA6kfcHY6VI62ON/rI12w3Ia7lyc
	GzcI96l4EUm9WV8gzlFsb+OEwpHbVM87NxdA9x5ce1bzHaacmq6uTo8lg6R14uffao+jabfv4JS
	WwJG1GtJ0WJ1T3be6CmUkQFlQE4axcSA=
X-Received: by 2002:a05:6102:508a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7c0f4061990mr582687137.6.1790951088447;
        Fri, 02 Oct 2026 07:24:48 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7c0f4061990mr582673137.6.1790951087574;
        Fri, 02 Oct 2026 07:24:47 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d873682sm919852a12.10.2026.10.02.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:24:46 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:24:43 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fixes for v7.3
Message-ID: <20261002142443.GA778834@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfbeb1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pat6Al7auJUlNe7RvHoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Lav0W9d7Je2_goP7do_DaRwV0LfH-j6G
X-Proofpoint-ORIG-GUID: Lav0W9d7Je2_goP7do_DaRwV0LfH-j6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX6sUELTSD5aiq
 yPIpH7FfhswciLwQUXRBwmoPYjs4vwXf9xREJTdfnqrHdL0po77POGXZHkqzUyce+xECUJwmErv
 L/5AkNQZU+8qINj9ZLQaK0RXII+sxOn32b/4f9Dg6UTc7sszuKCR/74TyBSW4w5m2fZS9tOyaKK
 AgecXmk/urYTIzuP3C2eZomYwhtJEFQZZ9Sm/KGfSmgOBdHR8alSn6WltAvRuIinFQtYlaDQyJW
 z48X5iy0jjhTg80dg/5Kv6kBiBQd1SA+E2y1A+HjiiVonDISrVfI39MKcOWlfFa8FU5skyippmk
 v/b3MflQCCr8D7HyDl1DnxTuFrZpreaW8SSKvCjz5qv8aglpJq1jEyXgiFpECNomY+le4ZDbN4d
 PcaVTH0ySkFOojUxIrJTTcqM7us/Mozm9KPvLvcXuuWH3iiK1gXQzlzPEDmCZd5MtumWUELO7pY
 Bp27b+dUIXbmDi8TMQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX++11F0BKxox5
 Ss9fKlUe6ExYc/xjjc3uvZC8FyjvohYy3i96RGSyu7fAH0AZftNjBjEoqsXcD+pxN0jYALV5US0
 oolCGdfZmj7TweXHYf/FN+VAe4Kundg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020057

Hello soc maintainers,

Please pull these fixes for the OP-TEE driver in the TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fixes-for-v7.3

for you to fetch changes up to 3c0d2f1f431c51a11253f28763be723ac782fd7a:

  tee: optee: ffa: support shared memory offsets on large-page kernels (2026-10-02 16:08:05 +0200)

----------------------------------------------------------------
OP-TEE fixes for v7.3

- Register the TEE devices only once fully initialized
- Support FF-A shared memory offsets on large-page kernels

----------------------------------------------------------------
Mahantesh Salimath (1):
      tee: optee: ffa: support shared memory offsets on large-page kernels

Shao-Fu Chen (1):
      optee: register TEE devices only once fully initialized

 drivers/tee/optee/ffa_abi.c   | 38 ++++++++++++++++++++++++++------------
 drivers/tee/optee/optee_msg.h |  4 ++--
 drivers/tee/optee/smc_abi.c   | 17 ++++++++---------
 3 files changed, 36 insertions(+), 23 deletions(-)
