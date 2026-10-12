Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DC3EDE6C
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803353; cv=pass; b=AopGyZ86KZrpEpNnnVRDvLdEuws+rhpT4J+BQtgXR4NJwRm5jzJqmB4J9qWzEed/MyHlFIr9oFkhRee2VprUuNX02hfh7wE/CHXAMzijXDNGFIEPG80e4C+DTr3ZbT7Cyh2Fb1HBobG8IOM+ISzHehDIUC6P4W+5TOLUZYNb3cA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803353; c=relaxed/simple;
	bh=7bl5nJljIAb2WspolmCw5jLQZg+Zgu0ZBalzXimmxmY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=g/gy4yQtoevXdZbPkCLUnxmxcNtwEurvCM2ouU8+I/h6wt/eXiHpUPcHKWv+Hh+AbnYMLEzj0dGEZfG6Flhv+Pc/cLn2Pb5MH+uP51n91/8HaghW+JSOWgVTFnyjtdcxWrV+44b2LqkHdhowsfcaqMrPGCf/i0Ge0KSmilE1xvg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=K6PBkWpc; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="K6PBkWpc"
Received: by smtp.kernel.org (Postfix)
	id 061501F0089C; Mon, 12 Oct 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791803350;
	b=JFSI6XfBPcxE2FHtDpu3YYdm1yvJdl8nhANuQIOvIGgPKb4etgiXlbE2yV2oATgjiYfj
	 epRtRByJx6febexLXKEw841eSR6tLnT4c+YzrFwhbpbGWkfg5m6bEph75WLesftYdpQuE
	 hzi52mnOa5n27HST8Stqs0w383+9q8CefGt4nV3QAs/CL8zxYTOiMgmy2tEox63nATye5
	 FV34zs8Uj6mAg6RhdiNRAwMRmAVDp9oEl5c8BfL17iRFzmTsNvcDI6jr/zJ7625miaiAj
	 UuGrEOcdl7BZ2lFqjZPR9eemiw6CkEIUtWOLrnkfGNVb1ym2yHENqCvBpxT/sZUUgjw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791803350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
	b=f5ZmUuMSyeFVlTJLGxZvReZU1aAO9EG9BktZMalAVCSVOcJyc0Q4qbqbVKW2UO1sE6GC
	 oI04Uztmm16DuGfEkkJVrx9SwMv+y3qrmpBoNUYTUUVOTWBe+hULtbqE+W2lkQc5Rm5n6
	 XpTkRoinvqzdjcS2yW+QpFYNAWdVp04SBWe2sp27/JWtvTmzSqPo7/emP7Tb80HtSMi5L
	 F3eStvvfYw6me35RS6N7pUY+DDa7rXr6W6sNG65joUw23JjcxBFmzglELOLQ9pPtaHSg9
	 UMJRN4oCh3TuiTwKouvbvhs+n+0Jh0IRmpT5wPT+hNJVWv/WgbnKkE6QcUrCKs5t8dQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=K6PBkWpc;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 882AF1F0089B
	for <soc@kernel.org>; Mon, 12 Oct 2026 11:09:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=K6PBkWpc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 882AF1F0089B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0a921ee46so3948737b3.2
        for <soc@kernel.org>; Mon, 12 Oct 2026 04:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791803348; cv=none;
        d=google.com; s=arc-20260327;
        b=T2o6MKKdaTQFVd3q4BN2KWLS5QPAYDUbUyCdEGvCiNWfERT1bzT2GwU4xOgTJC9gU8
         yTDi79MzIPou66xJLfVhV+zuJsjns5Ek8bqeYK9iwwiWCnRxHMeYQ9MVTD0a75gpXLvj
         iO1OUfnEOTQzJGE5Z87OqMqM8e7H0exca4TeGXG88v6bVNu3AoqNQdPqy6MA+OoNIBeR
         M9sCbPR+meXpB6p0PhyAPb84Lwr4J9kiTDA0FTqNPfHjRp4L0qmjFhN7JnArPZ/QdLtP
         fr+3MAuJ707M1xirkF9AgO4UjZPiY5UDKIuMlChaAbK8rrcOxU6d8CtNYr/bAkHUFdDw
         7SNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        fh=USfxQ7v9YbbgbzUCK5rgK5xnF5L0usnYcuhWnAGI6mY=;
        b=lXv+sSqCwb6H4O6vmbV8IEbrS0cRgMf2a+6FarE05eXr8PB2dZZrhjEXRyGI/7A5Rm
         HHgOArooC+Q8A26XSXxlqVpw81Hm7unoxEV43/wD1PWcD8LHteLG/DAtZGbkMxLBT0YC
         kuaA7ZInFFkXn/VaLE+/937QMPbQDCStET+zRWnGQiEtsdn/ZMye1qYtCiOgvnsMv/Qu
         B3ivFzKeqk8s2M7Mk+iNkS2SzDO17LZLZfqHJtunXOa/fgSVcSvxWe8JLAlA6Gx5ldyh
         QgfQO0a8FMCaTkATWchbQwl1hjDEzceiXLra+j6LchnIWkWs80Wgoi36epwzLlSyk2Cq
         PZJw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1791803348; x=1792408148; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        b=K6PBkWpc2+aPX8OyCSz62+YFuXXo3VU70aTkfu/0YddRL67ZBzZdG1Zd3rg292V+qG
         KZMl7MFqUHiIxSqXpAwbQj+kqs15w5biwn4ibx3nYIK7VpeyN9EAXUGrQN8WxtQq/5Tj
         AAgfd9VDmQ3T5fbVvW3e4YokuaRd2FaFQLIhOEu0i830QyyT7ronQXIlNiJzwY2iyp49
         QHmTPF+S128BWDDVXKT8+zlGD1kRWaQ3zDsMNSO8q4+iqmZ+9PA1kuR4ELgseox73YnG
         NrWiXdBRTGxI3vH9t9V/2g5LkB7wzeFKNS92BIrJYOQPyeVgCtPxEo0guuwH3H3ZOomU
         rnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803348; x=1792408148;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        b=MZjY9JifYU52KYiu4GtWgF7wujEmGhGRVrZ7r4BK10YM56kOFIvq6QwsVlLM0oep7S
         LgMFeSaU6u9e0QuusySi4pv2wmcTTsYk8ypDukNQ5MjWiE682+YLO01FJ5LJpQl5nY83
         q5mzlhGhvAru7ewhxgpY9nijjgPFBNWMUmmonmKLpLBgKbxg2Wt4JyElMjGaIr9/X8SU
         HuOHyicpFix11WkTZsMZjNCRhwwXgoeUwaZPTFNm8sJ7P2xyX257G3Ny4qefKBNSvPmV
         Yu4BkeqhOZ+k13vQgZntaXT6FFPfpkvXaZhNZBoLzjVEMkOB9fS0vjJC27SaYKpOxjqT
         6X+w==
X-Gm-Message-State: AFq9FYKudaUyVzRBnq6DXvq1/RTXC99XaSvtorsO+d3zKkY3Rw330ZvI
	nVoNx0WV9kQiZhzo4ZMA1Vp3DO9Ffw96JbO7xJV+T+LiaqwMPTz4X7jU+3Wj4c5ypQgrN+iz7NH
	3XTVtzguLZZtehvgSAJ7nBWNA4UyT0a7EGM/qrFkNjSuGK9DZfQiVgU/D4M4=
X-Gm-Gg: AYBFou04OQtcmXfoSALlly+Q3zrt3UftRaZzd4SsyYp23qRTyZwG7HZz0CzSoXm1asR
	WebSJavyHoqeyh1hdt3syw/7H0gCYS06eZAq8BHyabneOswyVYB08E63c15XFUBolGqMDm87/JO
	qELswlh7A6Isc/vedABjTCRbmlM7km7t4jhv2rOt2+vRR7kZXBoEwbLaTu8teDcfN+DTRpUl+zp
	f6lp5SjjCS+PcxLQSIbH56dJcZmtx9T474j+lIwQwrNr+HAuVCi7Uq/Ui5APIQA+XFfaronF1X5
	d6gcHf/HFZ/uYDoNfKrH8/T2NPOdymEeqDov2SgAeKw094H0OwkSC9qWcuuIYudgX+ky7CG/rwM
	M+3wXLPCuxl0U
X-Received: by 2002:a05:690c:370a:b0:8ac:e42d:336 with SMTP id
 00721157ae682-8b07edb8fabmr25482837b3.76.1791803348051; Mon, 12 Oct 2026
 04:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 12 Oct 2026 13:08:55 +0200
X-Gm-Features: AclHuK8i4XW95QdXP2VomS2Z7dIRWbsChmcMmz7GfYRQPqOAo1HawWLt6tev11Y
Message-ID: <CAHTX3dKJ9DKTUHOj+KvUVuePPXF25gmiLeaDJChTko9jV0DmFA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.4
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull this simple patch to your tree.

Thanks,
Michal

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-7.4

for you to fetch changes up to 7061674069cb2524e7bc58173d4c816ed6529da6:

  ARM: dts: xilinx: Replace spaces indentation with tabs (2026-08-31
09:16:56 +0200)

----------------------------------------------------------------
arm64: Xilinx DT changes for 7.4

zynq:
- Fix DT indentation

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: xilinx: Replace spaces indentation with tabs

 arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
