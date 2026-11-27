Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795778632;
	b=KMiFDpXNWRPUqoz6DR41B84fVEOnuE+qW8V+cYVwZGxgdRihyVSXba0VcqhZXWIPbui7
	 ooaG/66RkEuG7QlE/1LqpXk1PkqJe0arf9XMqwICL+7P/AF+3FOFnanur32BFzvloBjG2
	 nveKaa7qVFEQG9rL3y/yg0CiYvuWn49TZ3O1v6P0lceC7ybVxNanx6IMXl9SpzcwtTe/Q
	 nniKtFhYkAEc34hqZJ+Jv2phFGZgqUzrWt6vuy5ZWE5prlqED2aqaubozRhQ1QQSruE66
	 QB3v+OhYSTzsdx14qyjnLHy7XT3eFseZIGMy9EggsWKPcoxRHSgKmeGiTpCRhtr+bGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778632;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oyVIHwUXpz396ww9F8tPBI9FmpRAp1M+eoT3A1GyqyU=;
	b=VFVWOrIALqwg3na1tMvsmK5GE3Bn8NZrwxlw0OgnFy1hldzD0DgNmmjdDeRWWMD1QrJ9
	 pGkYqR1KLk2nBQpg8krOhuHj1HhyGKDuUgGM3kg59+TWTGkFG5bUsYamlXNXsrG5V603G
	 edPgROKb7Ve4TySPQXwXQmPAdh97vfnv0U+4vf0CxM6O2OngySCLAQWa2SH94J/i3IgLF
	 sD8DHJdDBWrnEznpcxh276vb70KnSOiUQQIECldHuLlvNa7CKb1LChWJKur8KBZFuagew
	 NHCe5hjWHQ7mGaDgTj6CsxvQxA7UXzp252Sy5MwvWp5yX/52Ce6diN2pgPXA44T3rww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CESoDuWm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuhIT+62;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C126606A331
	for <soc@lists.linux.dev>; Fri, 27 Nov 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CESoDuWm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuhIT+62
Received: by smtp.kernel.org (Postfix)
	id 0583A1F00930; Fri, 27 Nov 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795778631;
	b=Mwu5eUEi3NNSSt9deXl4XVvLrLWdmXeI6E1ZVpSbtWJ7dba9tgbqm1hPClkjbi7GUQUB
	 ucV1pW5I5cY5BsUQMYTMOydHtnT6UvqpqXYtdbtocaYoCggXQgx4G94ZvwWRuGdQ1VFvD
	 /X7ApRln1eZgCKXzz1RWye35pMxvU8T6HIYZEFLRD0zQgPzjsf1YYK5GGpILLD+cuB80D
	 AhWAai0469U/mQ9kE2DwNjID1HyG+QTIbQ9YqVmzBiJxDEOGlEbVKMlyscJmBmRlWr0uY
	 Dw8iuIgnp3God+U6ySsRLWiajJxC/wq5KC4ykjLU3bNILKRJARw4N+ybVH3n/xkBa9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795778631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oyVIHwUXpz396ww9F8tPBI9FmpRAp1M+eoT3A1GyqyU=;
	b=2aX+CDN87xG0yTh5N+1EpcMeVGvmF6FO14TV6qYiKrsNitgvA1LYd4znRzV1Bd8JVv17
	 AII2R/7qOOfMTqiPdJ5DbpEYLcoOMsAOWCMFVCcRnEiq6YCSsl6anK7BqGw9+HUGo5QaE
	 LVgP5ciJiLT/0ffQUy6lMlj+iEoSJnf2AZnl8J0xGBVGgDy0ptHaVzP3yXnkDweY/oeOt
	 IVwnhSdbRjJuINnzovWfydI21IATzROn5iFQ6kSgD87VfrPKuiOkbXaX/TBVhgsnjaSSK
	 2ugenfPys/32dMarkzSXvJpwsY9C9Pusm+hYHASuB+rWTdFf9ECBVnPDB+DOyTT7Lbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CESoDuWm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuhIT+62;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9321F1F00899
	for <soc@kernel.org>; Fri, 27 Nov 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CESoDuWm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuhIT+62
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9321F1F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApWxe1685569
	for <soc@kernel.org>; Fri, 27 Nov 2026 11:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=oyVIHwUXpz396ww9F8tPBI9FmpRAp1M+eoT3A1GyqyU=; b=CE
	SoDuWmuat23oe0dRvY1isOww1tPGxyTPRtmwQoJLYRvXTaW8T5/rUzU5yaqQE+m/
	B07WDfw9ogcSAfzdvjE21c/0WTJhGjDeqq4F4709YLTdVarNLbV641zj/dxIR9Dl
	NTL8ZNK31mirP/MsE9aAPwwA1BQ9ADdBO1Z/DojicveBrDcv/k5HYbMXPwz1/nAp
	O65nQUj8tFkW59sWDBwELn4fwsZnEohdAMa+28p1IquzHep5OB4YknCJxcL+5QRF
	l1tkGTuBZBuTxBGX6/bpulj47Q0eHRrMrHlKkLToW+G9AypjwdOGVXlIqgL4A/lz
	Teh+BWz2NtNDzXr3IX0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k90ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Fri, 27 Nov 2026 11:23:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso1341850185a.0
        for <soc@kernel.org>; Fri, 27 Nov 2026 03:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778620; x=1796383420; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyVIHwUXpz396ww9F8tPBI9FmpRAp1M+eoT3A1GyqyU=;
        b=OuhIT+62dqgsBFVArEnFWYY4gWnUGcamB4TD7MmnjHa2bfTYUflgz8LfybyET6ixoq
         06F3m76xf4Rbbm4PbvUrssKZMoHvrLJiu4ovnlqa6rT+R3erSUu4u9yRbyOa7RGXVzT/
         /HbJ4Dv2k1yzWDpC7FIX3cegjhaf2ba2Cvfp/F/w+QD5Fpj59AdzvVLJW1FFTSDpx61T
         PrJ+/pQ4QZGNERL+n20A4QYq48yc7JIYQupjzD+oc4Fz+OrzHpxhhj9wwqUelpxBzIkI
         UPwpfoxDlIjDocLqOdQEtZUl9ip/2gUOrg3pkRIIERDn3l0Gn9ZIvf/rFHUYcQkA//tf
         FTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778620; x=1796383420;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyVIHwUXpz396ww9F8tPBI9FmpRAp1M+eoT3A1GyqyU=;
        b=ZRQub/IXrEPg4MPpQdbZY9ESa0wdZiKlMbnzOzu+tStgUhPNNEpFx27h0Z48pKKNWp
         SbRuwafy765g4eW915bMPlCV9lfq1wceSNQQNhCFvpHxn6bYu0d+pN80pEddDAXkYNC0
         yqkfyaU09yUd+sOunk4natIhyU4QRf8HQ0Zgaehqxa5zECvFrz8Ed3YpJWwajV/DzOes
         CjjylF40b6awpxb2AXyHFP9IDqUbWt8HTlbahNLocKS0H5LkuPjr/n2e2dLh1ZtpNi1u
         yHyg0oxaCAARWFW4AE3DmG4UvnMRtEtiNwkNIyIUuyyLor4bOWh6b5DSQkc3AWbEOzg5
         ufAQ==
X-Forwarded-Encrypted: i=1; AL+hErHpQyZPFVp7zM/BHNkd+t4u1AAlJ1zDsfZuTPvnMbCh/qcCnoHaVjWt3Qa3rsMb//U2e4E=@kernel.org
X-Gm-Message-State: APuU4Z9jYCvwsKNCScOHaCglVQEJPdHh0mxj4fpEWi+CxwF0B5fueuRm
	1v1Z8KByQxFzijE8tuNX2abUf2hiVmhHXDptuFuM+rqsgJd1Jt46eEhLUme30jJDENhZqD8pKyn
	Q4MVvK1ShyZOs9RRINi9DwN9Ti3l2fBpWN97+a1XpVDvbUtXl
X-Gm-Gg: AZFdTZf9pH5kH66Iet59zXTwDB4Rjmt+nUcAw+xPCeWHwTSHGQJZZY1gx1G60gih5YI
	o+fzuseQ1OLozkJpuuwjugpwAAdPcA+VT57YR/QDV/UYAZ2aTIGoyvudEqqy3Q2cewcokSZ0/o2
	1TpvPq5hX4PFt3AI0NCmfvOsm8mz+Ng4p3lyodp7Y1U/yfzmGFV98PahtqQW9bVXD9EGdtxm91V
	Z1H8+FSNqGt/NR/hlV0BXaPVmdXFtCFt1f5FTYp6J/PSyqaNy8t9QysKL6ipr5nMNm87IaUEFCq
	qLuFt2F0nA8fe1JHey1al146Sg4c3yBFIHp0nK+gpNt6k/UUOee+tbfIuSZlNK0dQ5AkLprJuN2
	xCrez54MuFWpqb5tiGst/3iVBpFjV3aMeRR9ezYH8R6B5MLL8/OiQ9uVB3siF9Mlww+J9h5GOoQ
	7zRdBUKj7xrl46ovzzd+4aMKqdrRDuTel3w4AYJOMxhG4+ZJxuht+1Fts+nkdFz3vg1Y/bx1ldd
	CdO
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4095406285a.27.1795778619967;
        Fri, 27 Nov 2026 03:23:39 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4095403085a.27.1795778619548;
        Fri, 27 Nov 2026 03:23:39 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cb764sm11193958a12.12.2026.11.27.03.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:23:38 -0800 (PST)
Date: Fri, 27 Nov 2026 12:23:36 +0100
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v7.4
Message-ID: <20261127112336.GA2749856@rayden>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXwoEOcFN0XUkj
 zZ9qjTxq+6wP97/rMPRcRwukCkOAolrBRlLjYRQSupTi96WOPt0aS5GZM/lLj05soWq14N3bRDB
 63BLQwMUAR0Zh9ZCRkofcNzluIKOwUw+EK3KqeckeKdozeapvPWD+v5FMVbr/l62ku/cHm0YnfI
 p3Ib7a57bNF4yUqxUoB7w5N51QWwPAhHKFzds/OSPeHTmc69aPuOXRLwXKDW49MvvC1Qbk+Ux02
 7gQIyH/Fdf1pb4zzgP8LFy4XHLuOfol5tz42OqqBIPYori0p1MScfkuqW9/pX8f43LtOXzQdbEV
 +QcjLFFmYFf1Aa26vL8h5RAaNHHAN5wITU6vDkD0eDz/nX9xO4A2HDvlDl7LtzHYC72JR2lojGd
 i26M+Mt0N6gYgC2ex6b4cYFQvDa9bvsVzv+yBnSEb42Z/5cs0rsMzlO4u27srqjz+1HLTxkChDa
 g++gydjoI019afeSpYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX461JvtSVXfKX
 N6tXxMoB4icQ6UpT27rcxJuZYPv927gVCnF0E4fSuFEujUCe3oXhPD41slmFOPgJ2oI8EwABvSI
 zSZO8IwbNXoT+Ceriyd/nwrpnb1ONrA=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09683c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KyRjHmHKXXPnJxnbqygA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cCAVhjPBPrlMsufF3_ftp-e3iynIqxJe
X-Proofpoint-ORIG-GUID: cCAVhjPBPrlMsufF3_ftp-e3iynIqxJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

Hello soc maintainers,

Please pull this small fix for the TEE subsystem.

Thanks,
Jens

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.4

for you to fetch changes up to 76313284b6a34ae7fde7ce18f815d25bdb1f5e62:

  tee: avoid accessing dma-buf shared memory after put (2026-11-09 17:10:38 +0100)

----------------------------------------------------------------
Avoid accessing dma-buf shared memory after put

----------------------------------------------------------------
Hongyan Xu (1):
      tee: avoid accessing dma-buf shared memory after put

 drivers/tee/tee_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
