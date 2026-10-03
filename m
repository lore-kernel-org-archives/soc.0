Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C7358360
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037113; cv=pass; b=QrVv57tM336FZ4OusLkosp+O/LIF0OcNTJCQpxW9ewrJBm0QmSxbPRXJEIplFIj12M1f6vdAYDL1DSUE8mjoydHLCe9oPuerqT5hCXWfiem/Pc5N48MmZ/vl+BppeD6zNimu08CZuHp5iGvfMCTlb/OpYqamYKvP6FAeZ3su2Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037113; c=relaxed/simple;
	bh=1eedhvqEoDar26cNo8xuHHgN8H0ummeN8BgfjAAH7RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3zd38avgIqKeWNQU8cSyHnUg0tt+jIwQkRfcgB0dQ2aSVMCvIWVC7nfpOpxuu25vgtEUn+Qk+AkywCKFwxrHlqSZgIdlqxjzg7wiMVLnscEaZrDlZQGeZY6hEyGk9rmyG3gtU6kmY0IjtjUwUi1j2DeufiU0cUW+BcUEgwV2KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1zuT6RP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jzwj5PwA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1zuT6RP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jzwj5PwA"
Received: by smtp.kernel.org (Postfix)
	id BA3EC1F0089B; Sat,  3 Oct 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791037109;
	b=CVQphOzgVK+KYOXPmaBam69KEbmz5Wbt6ctNHADYmEh55wrYCmErd+gxwhaKKM5TDWsW
	 N4YTONocbLgX8lJnYVLbPmqNmQ5/HUMfymP5MgxZ0vEsH5ny8NVLc5ektFBwO/z+gmNiJ
	 cSXPL7/b4y71G6ddoXlmGxAcGrKfkTQJMCjwgQ0gGN6fVC8eAdPtWAhl0DsoqGE6nA3Jy
	 Nq56QevyV96BNYbY/n6XwUqIJrsyBeyNi6Iv1QV5t2982J6o0uWWRhoL7KklMe+RAZIgU
	 BmKR9MMhOZ35lOP9Ax382Wda3TEUfTXGmMf0nfi7XtAxAPhwh29WuhNUpOoRlwB88ZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791037109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=;
	b=qjT1oT1bm3xx0zpHhHnQAvIMNKd/aFR8/hy/CNmH2+zwt59UaEjZvt9FNjoJg9lQBsMz
	 CwQ4kO0teIR3juxXcfSAsBNRyUfHqjMIdhRNujfMO4n9mYJO+x3PGtCP2QPz7yT9ZqEDe
	 p8j0RsZYBenzMMP0izKam8ddQppmDTI8m4CD6E41FK0a/Q76q2S21bHw0loRknn9oDDIK
	 rjblRV+7xnCB4Xg5YgvFG74L0Mbxxa7ZOxJlkF9RgmYngFdfgponEX5ZNMEF5HiDGlGoX
	 S93aY0dr+N0rLaIaPUeZXS9oa223p8at/nrJSQwL6T0T2SqHLHfAMDkRUmIo9SWLB0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1zuT6RP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jzwj5PwA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60ED01F0089C
	for <soc@kernel.org>; Sat,  3 Oct 2026 14:18:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1zuT6RP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jzwj5PwA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 60ED01F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E5mRM3845447
	for <soc@kernel.org>; Sat, 3 Oct 2026 14:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=; b=f1
	zuT6RPpHDQJTsLLNaezZEgZAg6NNzu9DOXrxWSUeAGkNZ7rpAv5GxSKthakUhnSo
	dmfVV2ldK/6PZoIfu2HczusHypT8zG+IpnWAMwHpXSsZwZkunZxtJquyOjiEgkWg
	kQOD/wFmg05yBrnVIk388C5ZHEX64YEQnkmhf558XF458dX6CLuhbsEbiwd0exrr
	Fekjxpc69dHlN31pHC+7bLve94NueU9idNkl88nO16o5dpVyoGSXVoDvsXMHrebK
	Ltw9WpCCbkubsTZinyRGv+p4SOxSYQy8IPMlomkGaUxSojtKQOCCwPKJ5VMHKTud
	rg1KSVjJO+GYpZWvM+NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08h1bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Sat, 03 Oct 2026 14:18:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so17064385a.0
        for <soc@kernel.org>; Sat, 03 Oct 2026 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791037106; x=1791641906; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=;
        b=Jzwj5PwA36QcfIfwg5SuLtAAca94Xy8/dNzjg7mhu630z1iJaAPwbBTeaRFm9/9kG+
         UQYEpWlvepio9X09OpVFP27HZZYoPf1FGB8pF5mn/1O9x2vxD+GOxlmeLJBJEziYyVYA
         hUpRK9S/BemqivnVDP7Bh3ymvmiW7Ub278c50+zGU/PchQI7kP86rpuDTvMLUyG78OqE
         OvwpfSLkQ5lVv1xS8XW69vWr4QOTVjotJsHsZMwAEtGQtIk+MthtOxYdU0nDtRCyrggK
         OZz8xVFw/YDVz5RA3IB851y/s8h/zf1ARt4TIPJN46ET1J9vtyGwteJSHMBoahAfaepp
         amQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037106; x=1791641906;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=;
        b=sGr0rTv20hqiEgtWmIxWPk85lQ+DA/46mBCSyTKb8LErbCuDy6kdM9qaIFe3enlA0Y
         OIrFWCNxj4QC3LdR/NvGpmOq2RQZhfpXSV0/EMcHlCpfBjUMMQhLUPRj+inN/X5c34ye
         rQ47O8twlSNGUn2CBYXuBwsNz1lDw6uNuAtAMMXMaDTY0SWG0R4VywwDxmnVVD8JMOL/
         BCP+xzSRjoqU/n5crR9FayzmYPBajKB9egzkgClw8nDLaVNZ8FWWHR90a03z/uDzCMZ/
         /QE4f3+YzZeUGGH8hid6PCfsZI/uzUbJyuU9X4xIt4XGpOLTFVnbioqdamKpYvDxfqVK
         gjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL23XYGTKlThiPEjaSvZIVxfigi3naAPkGT8pwlzTqyxPDiDkThGcjk4Z/c/etAmGOouM=@kernel.org
X-Gm-Message-State: AFuF++nF04+asAokQFGhSLJeLdc5c4splk8vjHXrDYZ0VYToa/dD1Ml/
	0m1OtUfMidJ1uJUrNWzhGTkK1rnXgHCY3oMgZ7CVo51BgPuPfijV6tOCQYOB1FZDTeLc84UFMwo
	vXiQd1VeuS7uJ57hbdEmDSqiQHbKXsMz57GrUr8iyK7voO2Ul
X-Gm-Gg: AYBFou1UeQBr4PIJNCHNDKf5Z/K4CSwY1yOM6RWSslqMECJPB1nztcl0SlZANGtonRA
	9AmohuCCTuBXu2KC8CYMDpEsCtXB3By5YRIUWE2MFBPEoZ88U6LJFPnVRx7IXWL4JmctNhXKjv8
	BnDtIy/dE19HvA8/P4sQquy1/T+JSy41dYPNX5gpVPoqHtWRreJJDaiEDP10msqC/Fe5KFSgiqQ
	PTG0+O3A3EjhSmXJ4YAE1X+q+FkApMMkxboHkYCajhJYiStmmrOTDLCOfZtQgwvE6h/yGCw27gf
	HXwuH/TcHXUpfrx3uxeoVQK75EY/O5XJH1gEPUj3C/B6VequP79I1LlLyackvBOu+dtGw8rL4VE
	CiLsX3U/gNU920yx2kRcpbl8KlslC61B+Jg6UkXZRKKTt3Q==
X-Received: by 2002:a05:620a:a415:10b0:92e:7d53:8e8d with SMTP id af79cd13be357-93cf16dae99mr844770885a.27.1791037106374;
        Sat, 03 Oct 2026 07:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a415:10b0:92e:7d53:8e8d with SMTP id af79cd13be357-93cf16dae99mr844766585a.27.1791037105971;
        Sat, 03 Oct 2026 07:18:25 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e59dfsm884481a12.8.2026.10.03.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:18:24 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:18:22 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE updates for v7.4
Message-ID: <20261003141822.GA927567@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: CT1YM1UTpDDSz1duhHduP95Piu5kFGGV
X-Proofpoint-GUID: CT1YM1UTpDDSz1duhHduP95Piu5kFGGV
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac10eb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NiBTYWx0ZWRfX6oLToS9rHxoa
 /iodjNQms23gbgAz6nnYLBbJ9ROSJ91+NCe9feOAkvX6q10TSClX+0UfL4g8OivSZBUdptbn5zu
 GRJTA6sACdl5WRjG5ROZO+E9Y0PAHPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NiBTYWx0ZWRfX77nJNBRzCwxf
 wwC7sgd61eZlphpirqu/JDYE9QpSDgaYw5yb0y6ZydoeulXIv1X2z+SBmhMBeMqu9o0U2ZxxHFs
 z+AJwLNyoq/gngd0rfReLmCqj9mVGoT6H53L3wSm9XR3w9NU9eThp4jGflmGql1HCZxKqDkE/JV
 mmfTKy3CWFtlh6yVqCio0YpQ8z+YJ3idZj+GUH+R0YB+7Y1qWs7S3KIsdoSEH8g/EkbCG0ANNzz
 8WhTwKUh/5Cei0XptTV4t8O4XkcA7Vx1Chfm2aHeL4Kp5czCgEtWd5ckVSIQWDNT4/AalkFLyEm
 wGO9wf48KXO9FjzCTHplWSmIsOrOtTOn71xk08BR/Y+DwOx6nhV4DyZFeQJeV2VaepLIvD2P86d
 Bibz2av+MfWaQiimEZuEr5dh2mSkHKgLzWV/PTr7K/RveR2y3JjrRyUycW/PJprcApIfgthleOg
 snAlWfO+zTTyK2pCyZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030056

Hello soc maintainers,

Please pull this small patch for the TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-for-v7.4

for you to fetch changes up to 6229fda9a88656ea7c727c3e2401080c5d3efbc6:

  tee: move tee_ioctl_shm_register_data to above IOCTL definition (2026-09-16 07:52:31 +0200)

----------------------------------------------------------------
Move tee_ioctl_shm_register_data to above IOCTL definition

----------------------------------------------------------------
Andrew Davis (1):
      tee: move tee_ioctl_shm_register_data to above IOCTL definition

 include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)
