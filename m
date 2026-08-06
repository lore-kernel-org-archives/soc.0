Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800633264EA
	for <soc@lists.linux.dev>; Thu,  6 Aug 2026 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021968; cv=pass; b=nDp98Sn3nz+CMD9kMozhSFP584XgA18djJ0FvaHLxjHTZXlJqO4mQ8LDnzUtDujOTPdfr/5+FuLVaFNHAKfsTTJdQvZhuTxD08IAKRouShIp7/AL48qJ0seqpmVgKzMlCAGVX9PfRnzXtgHi/kX0OJXsQngKW/OXfFOW5ixbEdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021968; c=relaxed/simple;
	bh=Zui6f0OLXqvJHEggmRTRDQbmSnFCEiav4mk5LerssQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t90fTmhO4JO0B0jea3FOF+PMyM89jNFWP30lHRaap4fTF+sfrsHMWVwm5wlM/84yD4kh5IFK1lxTO1B0URxxcQM30hm4se7j0w2bnzMHXgIvoFCmWa4nqHz0iSt3493l390qO7E92GXpNw7ZBdsgzjyvzNSeZDSStMOkVthpQv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hadogE9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbAd9kRD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hadogE9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbAd9kRD"
Received: by smtp.kernel.org (Postfix)
	id 9545C1F00A3A; Thu,  6 Aug 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786021964;
	b=3nQ08s+LOl+tVt9qtkQT1vVrxDPrkmbKI1VKA3QKgVyu9y0Y0ZNrHr4mt5bcsqmOS8B1
	 tTxsniISjYQ6fva+8gYfUIxM8q+d/k1LR2ec9u0MqO1xzS4GN+z1T277xCU/iPRrKcBbh
	 YY9FlINdz2S34K4gx5lgXC98s17qftUcMlShVCI3uYF1KZM3lyfxcSV9FghzHIqOp5qBh
	 K9/Db8Y6pwKT81oJQFvdO24Sa7xiJAvUTJlYin8EIwsnBEad9oiPslgE+9rOW2vEuKfq4
	 r5XeQ+LPqL7fVhVfdX65WERKsT9456CGfnX5Nh7T7fMCZDHoW73ImtSOBRJJQJZZIOQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786021964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V1r0LtpTW3eeCBGnazGPaqNBduaWUCSFU9Jast34XZ4=;
	b=MxmZmkS3nHu5b6G/q3W24etJvhl+sVy/DQR3hqxJ9NAaqtdt0Bh+3ywn8ZxFZ0P7dJAf
	 3sOYnYS8O+Vhkg8QFIocyDS2muXmwK59Bbc/P9IjNlllRELS9LylF2YKKXRYZyuVaXvlj
	 SBEajQGN+hyGz1lGj1rfigHGT2b2ZkCyjCnd9pywCeRdSt2fOvuXRoALTFIVbWUf/RBpT
	 gihAuAQH1hJEPfs/oLRO6e1OzZsah2lMCNBej41PILj9Q3VmgHk23tdwnI7/fyVDpCUoB
	 cbkFnxM2gKMQXV7MwB6dv69+2S/hkJF0bQWKfGP2aH5gezVYpLdNMRAPNIrsNhnr/pA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hadogE9r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbAd9kRD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D194C1F000E9
	for <soc@kernel.org>; Thu,  6 Aug 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hadogE9r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbAd9kRD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D194C1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nerG1876452
	for <soc@kernel.org>; Thu, 6 Aug 2026 13:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=V1r0LtpTW3eeCBGnazGPaqNBduaWUCSFU9Jast34XZ4=; b=ha
	dogE9rKDcIYzxVUUQhU6ouWHowhFp/Pivondrew2AIgFuTVp0TQe2XLthSzyzgnW
	0dh5/Q++jskasTgJuKO+eutuOFX/8bdsGTXZ+2utRFDukNMOi5zZz99rG/Go1Q6o
	exlU9camNOW8ArCKQRc1aS88zM8hSS/QadT1G/u/+wpcC1hPDnA+M8AsF3JoZra3
	qWrlPVPDBqR2kfuiabPI2qD+ZFrHQBh9cde8EabmdY92pc1AHIDj0tPFbdNZKJJf
	bufVTeCYlR2J7cY3y6KKrTA60nIcAMfO1wHr6CQVwPLpqzpv36CaPgINONWUfJrz
	qliG0tnwg6oBC6MlqiPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucj9qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Thu, 06 Aug 2026 13:12:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso25362821cf.0
        for <soc@kernel.org>; Thu, 06 Aug 2026 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786021957; x=1786626757; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1r0LtpTW3eeCBGnazGPaqNBduaWUCSFU9Jast34XZ4=;
        b=MbAd9kRDcqcHUQ/BMvficxMHdGe5oAaGxl9wCapW70dgS3a3h05RNAN45UKqwFivLD
         YArsEPcBzYWgdtUkcFx6SvXj73nd1QF9sweFfRfAXPKSWwWcdI9Nn4KvcrgEh8awk6rN
         VItAGorXFGnbo71V0NA7Pk/ttMDlQqk72MIpxKO0v8DVttk4BtHC3kv7nNgIWVJAxP5L
         mSI6HyaTl499q1HlRB176RGipRoITaEbNg0lvcEwvvtFKVcGxbP5n/SBHa6013IubUzO
         Hrla0URbr2GQsiub6pncMSL8ZfoH8C9sS3ZNtpSPHh8e7NLZ7L8dVqaLT3uI3P2scZHI
         9oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786021957; x=1786626757;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V1r0LtpTW3eeCBGnazGPaqNBduaWUCSFU9Jast34XZ4=;
        b=iuCOaAOpPEyI27WjmDOzleQWVxNY1lkxDqt+guHS7V2N26iKuEHWp5vL1aWsFybsrZ
         SbVmNNYj7QFCQQUkwCTxOM3O8Mv1tT2FkX+xg3ol1kLhsEUXp82ackudU22Ojco9luMq
         3Ki/fME3AKNnRbi25xq3OLWJ9G/EgsAwslVqhV+3jZ/j6HsCllNpNe2K51j1TIZmIE98
         HL3+TTjBo0ObLqtbW7NFf+FrfsxETNRcNK1MZMajAqXJwmzMsLzsm+eKMBKzeso1ZC1G
         9oEGxv6DTbxEhndK/HTcpiTfl+AVYLKptWyQhU0Jcy6a44rQuoPX2UuZY1+rqp1ErCoQ
         3j+A==
X-Forwarded-Encrypted: i=1; AHgh+RoSYv+hsZHOa2ynKM00JoOc/SnyovyPtLTUdD+gvBtNkPm479XOLm6Mkp3udriuHjlqdvw=@kernel.org
X-Gm-Message-State: AOJu0YwJg5EF2r7cp/XoGeVvwL9H7rbW70IQ/SZhCagI8TIwrdCBFI6p
	9WQMvg2FSz3MTtTQJDX7gBAbHA8sgUToFOlARNvg7WLsrBAB5QoS3jyE7il/aCopB7rm/IypfeS
	yD+DmojrcZdTNq+eFOqXjCOBrNN+TGsjeRpYHm4ETBySXKUKR
X-Gm-Gg: AR+sD10J070JARD4LhsWiajdBu9rr3uFrL7KcR2Q/tfM7afTF7mrj69PWCDfYiQ/Ks8
	vhIqgX+HBh+B6NR+xt3cwYfA338lfMm6G+YQxktgw9dLSPll+toFX/dRb+ZTtO2xjme10XWqRvr
	v2SW53P6Fdz1rGuqPfM+C3ChRHd6QEG5UTHzawEqwWzMjiXITyZ40kq0VqFLWN3sKlThUvD2hG7
	yONE5g6fZEHBBzUh5KdtEcsdkYWnZTgsxcb9BrF0sa4008RbwXSjNEh4A8pNSdwGdhmCy5Y3TRF
	KP0ao7uJggC7jFBP8rJuwmiHjIlYgkGpJj9DUtzqA+Sr30OJDEKhemVc+neBWczgl2jYQG7vtDK
	O3QIhmdevciHKMlSiK4UhV7Lr76A2lj+a1LaYqdAPLNkW9w==
X-Received: by 2002:a05:622a:2b0b:b0:51b:eb07:28bf with SMTP id d75a77b69052e-52ce6109688mr169714331cf.22.1786021956860;
        Thu, 06 Aug 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0b:b0:51b:eb07:28bf with SMTP id d75a77b69052e-52ce6109688mr169713171cf.22.1786021956221;
        Thu, 06 Aug 2026 06:12:36 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a196af02b9sm806417a12.30.2026.08.06.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:12:34 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:12:32 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for v7.2
Message-ID: <20260806131232.GA673420@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNCBTYWx0ZWRfXxgC3iBaXYKB2
 6oz0rwTyn4Fj4HMOWehKxdguwfPsNqdrtDwSXymEBLkx5Fd0qHtzutVMC2adTLHIN3PCDydi7de
 iy4KwK1e9bnvpesjIvm7QccZUYdFq7g=
X-Proofpoint-GUID: KNPePu-WVSk57fFt1c4O55S2cucyK1xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNCBTYWx0ZWRfX7F+3OWrIRNBg
 8w6Xnb7xcuq8xFqiVkYyAvVHQ42QVZqLA58nXJ9yDsRwBOyC2PVAh6/ZWQj6bNVniwkDOGUMikX
 yZY+YbIG7CDjsV+D2foa31375p+EsojDxrgXItR4xASeHcnPFO0V7PkEfAuwrfOKkdBScVGOBkp
 xYk3/gx8TDzx6V6vjGQH9vZ9qW0DUpKaYrliq+kL5P8LAaCIakv46Aq4PNIY3kjp9jrvX9L1ogU
 ZnYuESHVROV6+b9EU7fTFiV/pO7ojtawy5RlG6F2pdHGj7kq7vaPPE+o7hEYSwtiUF1a6G7xHuL
 9OHz7IgX4N2wD1eM5lZKgZVLcvGJLpu+leFXhwF4ufNnpJm8qL2Wakc+vDltdBSK8MiVM34b+BR
 4fkWqsf7b3KVZP/yriXVaqxWbCXKUxF3/iTbUH0xUQ6qvIpfSp0bk5u8VWD8oZ7rYRrFnelIpJF
 ZRV9TK3AyLlR7u3FAxA==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a748845 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Oq0JbnJb5wmJE1LcQasA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KNPePu-WVSk57fFt1c4O55S2cucyK1xo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060104

Hello soc maintainers,

Please pull this small OP-TEE fix for the OP-TEE drivers.

Thanks,
Jens

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fix-for-v7.2

for you to fetch changes up to 650c88738ae8976f46ba71b24dd8aa311adc6fde:

  optee: ffa: Add NULL check in optee_ffa_lend_protmem (2026-06-29 08:04:45 +0200)

----------------------------------------------------------------
Add NULL check in optee_ffa_lend_protmem()

----------------------------------------------------------------
Mostafa Saleh (1):
      optee: ffa: Add NULL check in optee_ffa_lend_protmem

 drivers/tee/optee/ffa_abi.c | 3 +++
 1 file changed, 3 insertions(+)
