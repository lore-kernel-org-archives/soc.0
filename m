Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA030DEA6
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038025; cv=pass; b=tLSOsVfWuboc1OOCpx65zaKCdR5SuEvUc5qp3nqAlbOcTHBNJ/xBt5iwyq5j88X2/DDNhyIeJEzBDcjOgtubl0XZpGkPgKfuUDldPkP/F/2MSbH4tuHX20yj2Uly7VqfyFAXaIof7YJevSd9E9bm+oeB2istEGUJC/R9eoj+fwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038025; c=relaxed/simple;
	bh=NNuJZ22mA6zExssbWs2MLuIZS0TFSBHvc7ThcVwtvn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZN8SmiE5iDZv8HY2DCHvMrREWQ9I0w9ZfgNYLBLQN2CE3QR5JlEtpzPbSwrykKCVVjhtsHQGESS0rMXC2EAagAvKkQx9JtVO8nB8qJhdB+WYDLi5nYQG5N7tcCqahiBoo8mN0jZcOsC/5Bc8uEUkCX+3wKVpJZHqxkCbYjDYG28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA5/QHby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGirSJ41; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA5/QHby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGirSJ41"
Received: by smtp.kernel.org (Postfix)
	id 4312F1F0089D; Sat,  3 Oct 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791038024;
	b=z2gg9xYeAVfRTqcVccQKoaqgyfO1pM/hLT1IdvmFDdxFLjVuoiI+f/GHdZIL0EQKcIrI
	 MW5bSth3f+KCWjWHunvDMQi1exz9mbwR1xWBRPvMKfv+HYIXIF2GUtV2wbfa5EMhIqWvb
	 qptmgEkczSWvRYlLQ/7Vm1t4lX/SXgQDE/u/RuevZI316f41UNTwWy741G+Qi6Uy84g1w
	 xBpNGNjo91QuJGNBggX6jzOOWCCQNFv4SBBzKXR7Rlbo0d2iGlQh3qvAVjqdJAU/1QHB0
	 xEI/d0giWDB4qZmtMrS398AL6g1wBS4oY7dfoVEHCr7HlEPp8svczPKcgNGm0uha+CQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791038024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=;
	b=0m0CHaHNEcK+vVWbMVXwKS2sbyrzzayYrsC3SABUhk0E4lUTP9DUiXNhZL26ziyJKmH1
	 2bUIuPA2rTNoIPw8C46VoH++QkeB3uRB8ENFBEvOX8jHW2/EUcbzxfHJ2q+Zk3hklI8kH
	 abZvSmUq56ZrdXJbdAAffiO78VQ79iPuWvEuxzcHJpcBXF2b8qN5A5MX0Kcu+GEjoxsMl
	 0EG6BYXAQ9LGzrPv06uXraT9qS7sDiELDep/w3R4JhDSiklETCX3m09DsZkKU8GWSsrZU
	 hYm+xwRr5osi2H8etLQ37rVyEmL6wkOYQX11jvFi5iQBC7c2xf5UWIQODQNIenCQo7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AA5/QHby";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGirSJ41;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 953B31F0089B
	for <soc@kernel.org>; Sat,  3 Oct 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AA5/QHby;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGirSJ41
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 953B31F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E60RM3247968
	for <soc@kernel.org>; Sat, 3 Oct 2026 14:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=; b=AA
	5/QHby7PdhLXGqSUGRfUdtuyf6DVwOKmUAvav3QvRSXiszqyuXSTdDMDS+5zpDJU
	QBADu/YRiUhi8MRSjtHbumWd6ZKRjuYkuntTdV54e0tSlXF5VrWoNjQZ53gmLq/D
	aTy2gYCfApfGjHpwW7d00ow+0nsA84hud8KO1n8vPrx2hfc7sHukmOEUyQSwmdz3
	vgjV/ZIZQ+Wn8cjXY4MrDjuKEHSdQdvtOc1mLs5F7uqwkRwLyP7GzvSR93bptPVl
	PkAT8mZu7ZLgOdmeJ1CABASAhbEPDIvBeyom0briSPi23BpAkw0l/DXJEIEv1ssB
	oREnLQzXkmMwcqIxyujw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tves1qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Sat, 03 Oct 2026 14:33:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbacbb996so48806585a.2
        for <soc@kernel.org>; Sat, 03 Oct 2026 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791038022; x=1791642822; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=;
        b=XGirSJ415vP6ok/VS34sZIaiVTkIFnXoRtE8mzaCuE54IQjUtnjHsh3fn8PwtcPJmx
         K3qDuxWADApQQoEdVy8kziiyqolLa53JMcfiFMr49GN2DXvxz4eNr5wBi+0OivGDBhKx
         NXBowpzHFP+EcfNnqzE/HIXJtausiuWaDBpH9F52HuSVE0ocEPdOZQyHJSsDKWxhUmF2
         YTmWwSWxldCm8208q1NcBZtwVsjvCPozsFloyef8O9e65+hHQ+HjBsGxtqtwqqQXog7p
         6r0Q5l74oOAI9TL32A5P/4h0bpaw1Cqfs2MXdzWY8hfIyfkRzw9vBacMN/87PXKWyJBp
         QisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791038022; x=1791642822;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=;
        b=TVqiQXksKaReLirKX21crG+9GkZjJq3V8wsVrX3JgelTk4mVPgVggPJ384FtE7jzaW
         DQdkU6MoS1dUK0sE0E5t6ZGscZwG03HQtxW3Fca78dAYA7NGe2ecjtLVlSAeX44dbgX1
         BdHlw744mGB1/s27BiMjlI3+4HOriwkr/i7GjdOdLzml+Xfw4S/OWYcuZWrokqXuE5fj
         GNorD1cHsc3PWKxoyrBJrbKTAbEqFHHD+m8UfXkDsUosqP7ZPR7PpoUBaV7rFUaA3faC
         WRq3mMK6NsY2YeLv/uJDYe+EDw0JO4Aa1ip4m85cpg47hHzjRwSPbwWNF/zhL0cJhE3W
         EZbA==
X-Forwarded-Encrypted: i=1; AKwUvBy46E1joA5bwCprXymcDpAxHwAvYS9qi0UT2awcJFbXYS4DXh6aJ/Ym8mYwTo/z2GD7Mbo=@kernel.org
X-Gm-Message-State: AFuF++mc7FilXKdF+HFoLUR0lS+Jze0M9UQoYwCQSgclIJWnXOxJRZZ0
	BZvu6o3xkgNXfSSvLrMiPH/1YgB4CBwMK6JxlgQ+q+uPA1N7h4qnURnX9MlB7P2/m3nR4xQ6RFs
	FpUKvxsveSFDaCmVkoVtnOwPCugLlCQihkVYQlXdki8TOQRb1cOvW+XT1yX0=
X-Gm-Gg: AYBFou3yMiKpFQ10Et3Jrp/S/mUhIr6RyMn/59L4lrna00K4SOnYY4U7/CX0Wh6Mdhz
	+ARqkyF5vDjii6aULzmh8fNpTmZtHS3FrYb4s7X1ZG+xlEBAD5dANWQN1bcCEeKn0YJ3xXPNd1A
	uPJxVIp1y5cmwzK7cIL2/FArZ2+knH8w5aQ2d7tNwGq4p1K8WruTi/pX4Glf1NfMRpP4vSvq9Ov
	GOI73er1WGu9OWPYNPyGFaFwDQz0qV2GkJ/rIxuPk7NwJY8ffF3mtL7oc6Sa3KYAApOOearIR8R
	4zuKIUr0QkbIZ3+f92C/Oaw7xtUUy26oXL8bSjDmTBufzXBq4167Sa4IOr+upr4ACLqF0Rfy00m
	Ra83b0mLIsYIZTi2pOWdWh75pYp2qrQ3v7qR06Px3guAy8A==
X-Received: by 2002:a05:620a:26a6:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93cf18b370bmr1068488685a.59.1791038021675;
        Sat, 03 Oct 2026 07:33:41 -0700 (PDT)
X-Received: by 2002:a05:620a:26a6:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93cf18b370bmr1068484285a.59.1791038021190;
        Sat, 03 Oct 2026 07:33:41 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd055c8sm199938866b.25.2026.10.03.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:33:40 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:33:38 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE QTEE fix for v7.3
Message-ID: <20261003143338.GA928803@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: PAhjLwDh6wwDkx-_pie0sdCU-6dOvBKJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX69uzeZJ0gBBM
 IyF+t8u12cS74orEPsUOYPBIHTpiXkdJGjyNtg6g/rvgXwgxV6g2Tsk/tlcs+q/LBqCNq7HQgoz
 JeOIppFy7iZEuk94h/1xui3W7T7Lbw0=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac11246 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX3w3ipnRTiwak
 o3czpcb7g+N0fYL1RjlsdqVErU9zS8EjrR2exHYR2I/lVCRgKAC5Jouv/4J0qCQNwpCgRIQdsPq
 mgTTaoW/dRQEyw+swWrELgKRry3jH8JhZjfVhujRlEuGAc23MkJ+x1QbHBhqk/515eUuN7RDgPd
 k4tAlzF2t7C+p0s36h6VoBSN25PNv3TDMlex88vwq4wyRHPLu8/RZSKlegla0H3ucwab+AgPt8i
 nQy3hpUVNJ3BGNEUoDPFY7k2ZLo4Dum5+vdjKE4e74gstHSvG2xEPXMwYpBo/IkhAXW5pot2GIX
 +UuarFFr/Q3GBltADN/947N9K44xnIvrN5mtuYJPdQgM3mUUFozl5ygXVh4wGLoZ3tSDC844wNO
 jTAIyKzIZBKIlZbjQMFcxkp1LR33Ym+fWkq87VThss2wUCyTH+xklwnBiu8jDCotS+L4Pe9T4iU
 bOfaceDF1gx39I6tq1g==
X-Proofpoint-GUID: PAhjLwDh6wwDkx-_pie0sdCU-6dOvBKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030057

Hello soc maintainers,

Please pull this small kernel-doc fix for the QTEE driver in the TEE
subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-fix-for-v7.3

for you to fetch changes up to 93847823b6761e1791a7db10f55bbd4f79fa0dbc:

  tee: qcomtee: fix kernel-doc warnings (2026-08-24 14:49:01 +0200)

----------------------------------------------------------------
Fix kernel-doc warnings

----------------------------------------------------------------
Babanpreet Singh (1):
      tee: qcomtee: fix kernel-doc warnings

 drivers/tee/qcomtee/async.c          | 4 ++--
 drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
 drivers/tee/qcomtee/qcomtee_object.h | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)
