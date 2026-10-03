Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AD224AFA
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037469; cv=pass; b=QTjvMTKMbt/ar3i6OL1FUBS8wjohr9fpLwkf4TDLV4vuJoE/cpeyAg7fJlVsYgPm7G3q1YaCcBhT2sSIBfVPPBtNlhPsKAXR1vk8+7LnEOv7nJjmrb5I3WSmSrM+KUgWetEaCRHHOWNwHFuuvmZsnpFLKSeGV7taxRHHm4x7N4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037469; c=relaxed/simple;
	bh=IDxHa/TQDVkoRWJAIG2dLfdXhjsjJ5M8j7M+zTqdjO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jruRiB5DjpQdGbnkGBn/MA/6UinrPtV19qc3TaplPwNvstbxdqjcXHX5IP3T+iFPBqn7m+Efagp2cq91tfIYjWrdUfG0LufDkgJkdjSwgqk5qKEEYUAEtHdbBGKuytoGxWg8h2tvUCElaqe359bV8FlGQEOwZie4LEfop/5ismM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzBWH51a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQrQ7JjN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzBWH51a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQrQ7JjN"
Received: by smtp.kernel.org (Postfix)
	id EC11E1F0089C; Sat,  3 Oct 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791037467;
	b=e7M8UPb+djStPwElnULDTh17hwPYclLVBSpqIyaum843DDOCtQcle1VXLhBq3hGfXGYq
	 4JKwWdehClZM8ydtWLmHdJKByFqr0Ux1NocswqERaQBjXwG11Q8l2yAcQUrUHQDLreN5J
	 jNhZgjnw5H3j/rhx0iu0rs6MJp4j7uXYELHHvqr7TTLcZOt1wpogZYQ7w1hNzvEmN7fvW
	 G4xAs3COb/GFD4O2wUh7ddYtjIxAg/H9QKqlDD6Tzf89S7KXhz3fznMgk6Du2eg3Y8PeP
	 w3uDh5I1ujl6rZRRlawmwODNUDV4BTvMFhVPWqJft+NUuE7HUvHoaI2pBLXAGHRb03w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791037467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0zbsE0omg0TYg8XlU4yqOBv+Ij+j5rVhI0VbWrq7cDM=;
	b=ZFpJQdGz/SpPi4v3B2doXnBrAYalxKMrzOcANS02cgWw4cFF9CLaqoxK0ngdZRYbVdfe
	 47T9Vamsh2J/PU4HZD6hPJICXumXMva0IKZxfkLjZKwhgvzULztk5wmH3mdJiCwzd9+wJ
	 rAGcK5gAUnjSbfECA3Yv7dRMCD9333mfoEK6oE63ZwSmIjkT1ITb17wxsdVJXKcFtA0T+
	 K358xRIbnHzqETcrCgq17c9Icxv3v+onJ8hu65FT7CtsCFAGfJK8a2Aavf6ibF3K9LbV/
	 I0T9vtbdTgA9RJpXKqCtaMNdJ8/w1C893YBCDiPHG2OvGnNGa2NpqsKF9j3LD573uBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzBWH51a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQrQ7JjN;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82FF1F0089B
	for <soc@kernel.org>; Sat,  3 Oct 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzBWH51a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQrQ7JjN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C82FF1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E6Aht262444
	for <soc@kernel.org>; Sat, 3 Oct 2026 14:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0zbsE0omg0TYg8XlU4yqOB
	v+Ij+j5rVhI0VbWrq7cDM=; b=MzBWH51aB1b4v71ZhF6iHdMvS8wyvf7D2bD2JJ
	p66iDUdHR1Sq4J6cu7JUvwDsDHThNIhkIauTvBW8ha0IxchX8Qgqj9ab93sZZmbp
	l8O2qaV87vD0UAmvMzH60AgM2z5x7LyLIIj+vrXZ1qRjHWkId62GfBAjid1c4XOZ
	nZ7vYEO1+VGG4pBDIcvUqyXv5IVcyqjl2v2oxIBqhcGhEaun4IQ7vuUU6XU/LrC5
	fnRzHgI3i+n89LNLZD6xvfMZmbJ2/5DyCv3BBSi8M68VFJBpemL9Ch6APsJi5iZL
	3C/z/J/YTrd8ghmMT3a2Vpvc4tO0Jnyoz3C6eEAOu5SGw99g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06s62x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Sat, 03 Oct 2026 14:24:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be1861d2dso75777085a.3
        for <soc@kernel.org>; Sat, 03 Oct 2026 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791037465; x=1791642265; darn=kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zbsE0omg0TYg8XlU4yqOBv+Ij+j5rVhI0VbWrq7cDM=;
        b=QQrQ7JjNB3JYdwTjjB9JazVPXFihnyy8yDa7UlMGQHZiNAqGUMiY3gNqOzafGtNEN1
         55MjA6k19qvKDQlDFV4al1iP8HB1Qo6bf+iBtZYv6316htddVMnu4VJIPCpTJt5D60yd
         ytIXLTjjIyj542JefUE6JlmTfh3xRK1ZKvnuEW8Tus9wfVz2kdxBB50Yt5ooW8s7FYFW
         qTeWhtN46Nx5QXZnCanx5hnBP6f91EKz9K20eNQjUK+C3hqSGELqBmBRm5dV16zvmiWT
         BD7eZSD4l4n5zRN7tolLU1GiC3nuBlsq3RtUWgVKVC7hndbMPsn3NHmujQn2NaUjOdlt
         4nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037465; x=1791642265;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zbsE0omg0TYg8XlU4yqOBv+Ij+j5rVhI0VbWrq7cDM=;
        b=vGV+pJnK65tuAkmhHQcNqEWAOZ8awivbZqzqK2XcrtTXrIVKYzug/Xa8O03U0dD84B
         7LJt9Gz2TiyuzkX/1+yq1j8U2kuf+gV5XKokCooiLbZQagg/PLzO6602vNYj8/PCX2YU
         duWKgm2BeZDGGMQYHBVVUUZNYX9xW1Ok+6/TrASMHLUbMJXXhHFCFSPZSOnO8pXEZZAj
         X7qpQyRb71kw6szeERKFAxWaGM+AQ/cEko9ixIWujoIUOc8SLdtDiv4WCYijcSxO1+fo
         0BjVeJC697m4j9CRa7Gy5qBN4m9aPbmz4WCOGzxGMkkx6XCzul9Y39uO6mrhbhvZzTSg
         GJpQ==
X-Forwarded-Encrypted: i=1; AKwUvByA0WMaj1hVOzkC+7H4IIVi4yMbxMeGqC5RQ+DzcVoudWTCiWOkOzl0baUCsYWcZd0Wp+A=@kernel.org
X-Gm-Message-State: AFuF++nfff3qcgXiBASdyYMnvmwyZgcQh3+X2+cvsPBxoVKTNXbJ91Zt
	uVzbyaLEFenAiqFPdtvwNvj/yQ1BdCBiagBLUuixxH+oxlxRaJZ8SCoz8boHvjjwf2xlQ1cx/PR
	RdUsmz9RHlq/3bahIC9Waq32JQcxK/C4naEEGV5IiZ7cOHnQa
X-Gm-Gg: AYBFou1eQJk7dnj14o30yzHfrm1d0800gTyNquC5d+lacWKD1lmbd2U12HmZt0PWBMg
	SBXWmqI0xTKdMNNQH6zA7Y1FBYklw05c/lBeEkqFxEDmqCGzXpv3vRfn7Un9FHeAaSAhXZ0fNME
	KVEk4UkeoAd4ProNo+qaZJrjVWtcaSFWLn1BE3BzVy6O7XGTa+sRV5NNOLQ6X+mollk9v7p6u9w
	RHUfcFQi0XXTTEXkE2oPk03M7uTDFCUFeyzMnOpHc9fDjxR2+GMOqK+3+DUf+stmR+HFfCGSZ3t
	P9veRSeHUofDM50TdRq2p5QznKYB+bC3MPJPo6Wcc1OW1wv0+yzEnNQTGJESDPEEVpItO6PhWFF
	86h8htxcCaJeFAH/bmvKSeuVp6xRaWV6KF8QPWPRCDDKQBw==
X-Received: by 2002:a05:620a:2b47:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93e50fe9f3amr495619085a.23.1791037465007;
        Sat, 03 Oct 2026 07:24:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93e50fe9f3amr495616185a.23.1791037464617;
        Sat, 03 Oct 2026 07:24:24 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e614cc508sm154549966b.38.2026.10.03.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:24:23 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:24:21 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE QTEE update for v7.4
Message-ID: <20261003142421.GA928135@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac11019 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fN7b9Ke3sWeyuNAp5Y2Tfn41ld8W0Baj
X-Proofpoint-GUID: fN7b9Ke3sWeyuNAp5Y2Tfn41ld8W0Baj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX0+Sk9i/uqxyV
 CkjMGcKjK4EQHC9xLVFeftYZ2kMc2151p1Sr1Ej9BBokFaNxFW+ueIxVO0bTKBqYO/kKlsppsQt
 JYl92y00CUxY7vni8Q4naOhq8Z4fwMOHAoFoMe1IiGI7/0SgqHxwDXPouwl1J6u6+7VvHN8T8fN
 /GFzh6IC2zn1XLOt6wduOfgs7pwvhJQb1Gg9/IUK+jhGn2rthiE17T2CWskFRRuIV3EQMU7s+dp
 +4oxCLu9UNuYtxa71KRCSulIYIuDBC/ITwno06HzECm6IjUKO5etqgATwXADhfFvVPPnLS9v0eF
 t7G0tHqkYUfeuU2qfNdfSORIjGvuNerxk5VBf3e6nvLC0lUVlQ0MsbOPwgOeT0cKvVqIIP7e3zO
 Bb1MkXksogHQn8K+faiAfd7OemeOd27w1/C/xUBS/hbhOsNK4bPi6AjKHQB1L8sI0PoqAYSrZJL
 8fn4TERlELALdRLZHow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX3ZU7vuQ/2miV
 pcB0LoUX3h9yawvZUO6eOzc9l5+opbkfRxPT+z4EikQcp2UsLf4tsOnwgi2E9FzSSaw7K2krZBk
 XB5Z4LuzKR9i7xI28SmS3kSU1dCsxwE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030057

Hello soc maintainers,

Please pull this small patch for the QTEE driver in TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-for-v7.4

for you to fetch changes up to 615970476444bdf853c7c3ecdbe809dbdca06c16:

  tee: qcomtee: Drop unused assignment of platform_device_id driver data (2026-09-16 10:38:46 +0200)

----------------------------------------------------------------
Drop unused assignment of platform_device_id driver data

----------------------------------------------------------------
Uwe Kleine-König (The Capable Hub) (1):
      tee: qcomtee: Drop unused assignment of platform_device_id driver data

 drivers/tee/qcomtee/call.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
