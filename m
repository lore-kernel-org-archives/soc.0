Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776487;
	b=guh74lHQRiaz0t30KVMkvHhUnXGL1eR6250+EyYqnH9KMx11qLbEvmmFQXsGTwO3bBqX
	 u3SL7gQPh0OwnT5S9e9rss0vlocsUbHWixdnsPbyd5yI05W6x2Tr8d6rspeMWs93JWW9P
	 oxDrFOyjqNkx0hiN/lMXB1Ru/i4zR+38Bldiei6ObS6o6ehL2YorAWChmCIJ/29+S//9n
	 rWTffl1B1CT08L+PZWv0Bh5fhnPpmvRQpKMz54J7ayZ6B4iQ677tAN4iVonAdjdNo9+NF
	 NCG7ahXOLgJkwTyp3opNq+SCKpYsBhQxytRAROo4icWEiTXOPFJYnlgLUnVBD5tfLXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776487;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
	b=UXYrg0ZkfJPVaklWB5xwRwMNcox4WVIbeUk5JM1gwVOGPjQ6DkvUkVMXqSc8drwz3rI6
	 a0puYGc6na/AXe3oKluib922AWEBBAXclciq/UZksaOABZzBg5RJ1x9KIqV1vgqB4EFQF
	 sooFMR52zu66PvWgz5ycMQri5XfNsTLvf1iBU7yk5mm0c0uX3vH/MhDjICZhpQBaunPZt
	 RezeCfAiMXSL5S1z1kqAxo0pro9e4wIXKSlNCQrljIGijgX1TVhu6/kSsxcOK7HusFIKF
	 //wXYP7YLlVzJXKSsEfWdp8s1TTCuSJA2vS8VfbL7YJ+WYGqjsuxDrYuUTEwtjkwhbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov5wmebF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B95606A331
	for <soc@lists.linux.dev>; Fri, 27 Nov 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov5wmebF
Received: by smtp.kernel.org (Postfix)
	id 21F941F0089C; Fri, 27 Nov 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795776487;
	b=U3Gb9NrzVSytKmkU4qkNWNKhtAQjOyjSwJjQN+F0+f9lbXJ2NOfyDTs1hFFF9S9x217C
	 AHjwAL/gcfKesHi/Ckb9yOoPIu6fE/HMCw302HmVTFV4Q01LzWdYcBSEFcoGOV8bdflgd
	 mPKEFyuNJcexN60sLFrVqrZR3gIfEVj7duuq6qTBTmDVITMgPW1mIl9Q4YHnxHFccgQGX
	 +QXmjHtLFg6tX+o7ULiKMaMGl7ha1qTDiJppxXrqMMCdwZL9eiFHqGcZ32N9VbrLayNx1
	 rozdMbOljQQRdgWRgSx0lnSqXWaxV3tvQfH+892lXHI1u1U0aKhHJG3bgus7e0JLxXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795776487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
	b=UdMY036IOxvwT995ygyQIbB7EA5ZfnIYUVOhITbho2BLRI2f42fAiC84L+O8YcdG9oUT
	 OVF5ENTKyFJgCXazp/19iVO0SPQ1Z1F8XGvgkxGRjESxySCEqYrun80w+KN5PHLdWyHWV
	 LZoRBYjoYbSY1CaAiDLadvfeqZYJryImPmokfdlVM0sLdZnDhECdsHGrH9MxeMYlZSaVx
	 LUjemAevrcJIvfnqhoRoXXTDAoxMM5NyimjMYaAahKOgwwtyoFj5c7cCAUMRz9T+7Urv7
	 1GZ5RZTjrh/ebPxMivkG+mgJuYAL8l5VyfyZtz7eOGVxIMlX0YF1BOXecLLi3jxxKdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov5wmebF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A7821F000C1
	for <soc@kernel.org>; Fri, 27 Nov 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov5wmebF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9A7821F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gcp11564733
	for <soc@kernel.org>; Fri, 27 Nov 2026 10:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=; b=M5
	tKHBIJ8nWRAJzDPhmHVzYuCtdlzvZw9LMVfCWXJuH+7nLvkau74NMoD5KpiRpm7O
	+C9nRYoKdBzK/T12Jp2hpAqdo+ErX66u+Z+IdG1xZlSdayg98QL3mbNWk49s+ccw
	c8At/XSk5tVvTE07NIplu17lo1GPOAcVzoxyPVNn72smrzOSJtoJxU50r++tvMw1
	uP5ILmYa4uBltmFXezN5FroarsLj4HIpp3mI03Qsq0ZUyEKI47oIKoOWwbHd0r7e
	/Zif9Hfy9wHZ/6xv1XV5WhI7H+ScbE91GpsuuU+BfS9lo/kldJyJkwX9gOw3llwN
	xnCW2gcYWocS9s1G77UA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas2uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Fri, 27 Nov 2026 10:48:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so1318997485a.1
        for <soc@kernel.org>; Fri, 27 Nov 2026 02:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776484; x=1796381284; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
        b=Ov5wmebFNgN+w8L1z4g7SZt6WkdbbeOg5mv3fvd/ldCEEAtdv2DZQm5K5lRBCwMSpq
         UL2Lo/VW2syHGuSigpknXfm8qnhlTrgKYY3gT2JM5O2oqYgwazLMJTejMhXD07tONB//
         qcqWIESdYuuc1TN2B6DTQaOEQjSEx2qvXGROJWPAmYlgc+t+lAaAqeXNqT4m/yoYekH+
         SmUPV/qoQLof350LMbfaM2zskI0RgQClLtrEIsCPyyx05BlYhIu8UwFPJAxMT2VmbyQB
         aJXj0Nmhm/N3mHq7UdFQ3RWfBNwtXncbG9zXB0otzaD2eND6jePrToqcf5pm33nSb1om
         AlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776484; x=1796381284;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
        b=hWv/+0mnaG8nfC3+hMH20TQnzKcq68KDaHI/wPIiZ+Crv2Aawyjs3AbZxoLQz6PsTs
         F8c3cE7/qnUzOi8s6Jelw+YzduJQ83bGdbZHgL3lcFl5gkkTYamJXbN5zuuONpvU7aSL
         Tb1ADjUn1lSbCWuesyCHBwjIkgKvuiLtpq/gAUd5yRv4inQ3FL/iZR+ID453opgDENyf
         nZjtCT6TToftYVhQGwanFHKDJbYdnS1IiVG66euBW1MByh1D2gWRXbVxq1JJkREfaQPZ
         D3vvkv2KonuWjBplOa7zuWkHurRuIszI6s8mZ0eXbi0IOSWSTZpjvA5sr8HOHTXyQL/R
         YVJQ==
X-Forwarded-Encrypted: i=1; AL+hErHUVks8Iz+u7Bm/eQWwTFEh+w3rKIZEaWdei06F1ry37jJMtX/AAniQlky5HHTrPAuwv8g=@kernel.org
X-Gm-Message-State: APuU4Z+NZnQVMNl4hftRUi4Uhrp9exuZ5NP3xbp+OXFC/C4nifc38oAt
	eJFxNMElgupVahDm772EwpJIZ9qiMfeXezQDIwF87p9dfUfxkQ6jYtfnC1PRltfF4qQwL77iAcK
	tyyVa8442y8rRr87IQcTEX2i+05gc0LUI5cEQkXvm6tFeDRV8
X-Gm-Gg: AZFdTZcId9PlLe0E3vlds5cHHpKmgOZPp1TlpaXRBZBUF5wj5hWqsuU4IPK158ibvt8
	l7KxRZ6Po6xECCrfvNISSHAgXbFSjx/XRNepUhHBH9jF+LCf/xWywNl3EtEogleTJRaFdrSqBlh
	TMAobr1ah6AGeXvA4saUbcP/GxfMyqUuMjqg3+B7GOuY54OHhFzZSwENLWdLl3vYIGWkNFJXTpM
	dFtdDrItZR9Em5HLfRoKmjJRgis23ij+/30OhWjyX5UlZWUeSE/DMDxUQK6DcBnJQ1oikqqtfFv
	Jyw74n66PuOBWVGWYn4CszKZyRpNqT9usSwkZedFMh69p2Dzcq+mOe13OtjA937qAGbTvKwLddm
	hO+bpRZRfXL6GjRvdgnieNfXCMqYCyFu23nLuy/gl4rY5Cd+KXwp6IGvnsW9hAwmFDsnVPiZdNW
	vRWcVodYkNy6PwfnnldXLKksA4qdjJxL8/baTRVESgErDLqNFLmbJQBI1DLF8l4eEAi+zahMZ8/
	t6b
X-Received: by 2002:a05:620a:4554:b0:93f:3565:813 with SMTP id af79cd13be357-949ba80f8a1mr3805079885a.9.1795776483804;
        Fri, 27 Nov 2026 02:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:4554:b0:93f:3565:813 with SMTP id af79cd13be357-949ba80f8a1mr3805077685a.9.1795776483317;
        Fri, 27 Nov 2026 02:48:03 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm10777328a12.21.2026.11.27.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:48:01 -0800 (PST)
Date: Fri, 27 Nov 2026 11:47:59 +0100
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QTEE fix for v7.4
Message-ID: <20261127104759.GA2747365@rayden>
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
X-Proofpoint-ORIG-GUID: SkxgHP6LCEr7ZWT66lmN5cS0FmVI6JzH
X-Proofpoint-GUID: SkxgHP6LCEr7ZWT66lmN5cS0FmVI6JzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX3Y5uPRybd4/I
 3xaBR1CrpmAsGc26o1bdiHLYnYBaqL+a4eqIfhM2ZbMTJDfCy4xR5cv3jg1MhPOKEe/1qd6sIct
 o98BE3aICtc28uV0ZHXp65yZVgvTP/1Yctip9bH9riYiTKoSEdjEKbMt1wO+nf3qWIxC8CMVSMj
 4cA7ZsAMhduqB8dAYWJz/OUq5MrQmX/1szyjtp/oX91NNguFw4krLE7iQid0vO9EQZaqZcEMm9t
 Kq2zWYMQ+VKWFQgUnIIAl4+GuQA0cFCCQHNADRPhf1XbypRlyoK2dOJ8i5NuOKKDve3BFrEjn6h
 Naf1Rnb4DAZNs1nN2hQubCEJkSwg6d6/B07Oaj9T39p6rsdBZnlBq795NOJHt6dPONnU6rWqEhb
 7qzvmDR/+lTR2yJXX6j+IJV2c+R8imhnZyFyEgodi3Fglb4NfY1kkBDfAYpenGYcbc1hF+BNkJE
 223yj+iCbYDIgI9EAIQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b095fe4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KyRjHmHKXXPnJxnbqygA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX5KeR3lHt4ZQj
 /DEkrklF4qZyPUsA+aJSySikNNs30EIACeMWKMI+GCUFWuVMtjyHlvraNelx3fHO9ejfhwjEPYP
 HuETkyfHCzKab4I++YUDBJbT9GHnE5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270042

Hello soc maintainers,

Please pull this small fix for the QTEE driver in the TEE subsystem.

Thanks,
Jens

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qtee-fix-for-v7.4

for you to fetch changes up to 5f1bad1c10cbd008a6b2042cc4cb486f6b2e29e2:

  tee: qcomtee: user: check the parameter count from the supplicant (2026-11-05 16:29:09 +0100)

----------------------------------------------------------------
qtee: Check the parameter count from the supplicant

----------------------------------------------------------------
HyeongJun An (1):
      tee: qcomtee: user: check the parameter count from the supplicant

 drivers/tee/qcomtee/user_obj.c | 4 ++++
 1 file changed, 4 insertions(+)
