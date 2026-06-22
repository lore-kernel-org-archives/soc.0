Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10579395ACA
	for <soc@lists.linux.dev>; Mon, 22 Jun 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135319; cv=pass; b=FSGzcVFF/jWC7lbSbNBZbdy0nmfyS07Ab/n1vh9NYglOnrx/xnS/3+09nLOgmjOnrmq6A7CDfG8zIGSargissqTqzWzE29Q/PoxXC0i+U3FXyM7cLWTzuBKQ0CxIKc4UlF+fO8MNoZ5ww6RzNAt43GPxDmVl0sWESykQQmUvIoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135319; c=relaxed/simple;
	bh=s635UTKumPMe8cWufnXiCDdVT50BWsG4R/LzZpXJB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwRBbamzRrjqFQjHiu6xS73eL48+uxdsc9KZO2gwzj3ODTClYLC4b3O6ekWs24LtPd6P8a9QC8HFuDtBzBoqj17ul4xpe6uuyF0wWkt7qvvaNO2e1ul4I6uRnbz0uA+bHsXSbsk/UVXPjnXrhIIFmAlPWORnZJM5g9KqXzFW3oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Me8p2wrX; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Me8p2wrX"
Received: by smtp.kernel.org (Postfix)
	id BF0041F00A3A; Mon, 22 Jun 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782135317;
	b=D3rG7jmg8JVlJv1qo8PXPLrRZ9Xe7Fzh1/Y7wauuyc/6yZcl6bwiFNsTThSAVonklQ/3
	 42TeeD5ly5SKuGtGiGteOOVaMBvI5m7yGQ3w7kERgl3bEXSEqf9pgjgPCPhO0e8IWl6Ui
	 xgXq0jI+3ciMp8jDiAcWKdEi3N8DcdBD/MrJD40ihehbflUzDoHZguv+N2cUbdCTMLwJp
	 yIxFf7qZCn79IkjoJScAOqPvdhYe4rM5IwnfV/6B5Jc1QDNLTezAyaURdBlXWsdVcfamo
	 cirIPWbhfpvWJGAXR//iF3fLfiLhv6LsE+F6c6/3kVay8dWuibs/Y9SgVULTlg8/BMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782135317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Ac3eItdwTjEGd0PWKIr5oxQPzgo6ahr6wJiN5owXcRQ=;
	b=KXLnmS7srXtAvL2+qOQzSaisXDOUfpwG7sLREEYNsjChqBK83xXiU65MARIK6lyHuIUB
	 BCt30BwlZqslR9cZ9U94bRr8bDGQI3LLfEf2tKlynHxk2z42tISg1dGc5mFD4XJn29t7S
	 sOl94D5rk2gMnBshPGH37M+TZwkQgcYo87JovwyAE0+E2KkXAH31igiS+4sDas2ZnI+AE
	 GYXMz4rwLg40vij4SGf3wzkGC6i0178eCJe30CnsbmTzsIcWy3j6ufrSd6f7hg7cm4+Yk
	 wAZhlZaxOysS7zz/7mfers62V6pFshQqBZbBb5Bjcy6m8ZsRBHWfOlbgQirscW+bnjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Me8p2wrX;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11F091F00A3D
	for <soc@kernel.org>; Mon, 22 Jun 2026 13:35:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Me8p2wrX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 11F091F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69690062350so3952321a12.0
        for <soc@kernel.org>; Mon, 22 Jun 2026 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782135315; x=1782740115; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac3eItdwTjEGd0PWKIr5oxQPzgo6ahr6wJiN5owXcRQ=;
        b=Me8p2wrXySi253dXuftHShFp8dQK3omREOKHOKwmmVjdAQE4KApWKaQDgXVQhDwGUe
         5WaWIZ9zHL01Bxnz2mxT4wYqVRA1R1FBqL2uZQDCRc+91KFLADG5Kiy6mGPFJZs7xepp
         VD2u3h8wATehD5w7pxxxxjJecH5+NdEgj+gclk0ioI4xTjdHP3vxy4CRYEGTQmCOTDnZ
         X2FdyU6RBIz2vd3x57rlB6/y0nnZmI3ZsIX7334eDz645cjcf8B2hnsnBfucaLDM/Paz
         aHMJja3c6ZLmtbVYsx/7nKq0cE7E/+idH0rESLhEaF5Fnoo6V0g+oLiKZ74DfgQsK8ya
         mM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135315; x=1782740115;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ac3eItdwTjEGd0PWKIr5oxQPzgo6ahr6wJiN5owXcRQ=;
        b=TsDMTRa3W7j0KZcvXzJQ7ekSjlPhMmPthi51g9x33bZkIYP7iQ9iJyIn6T0Lz3SXWT
         szJoKcYElsbx2NgasRSCZyohIFB652GygvNzpe//F+0I0Ws97ikdWek2k5XgnLkV5zi2
         Y5QKVXxNjV58Sj39OpnLju7+yh8ie7h1ey5R3h3pqw99GxzuO3q/nSkM3qSHFCc7CB/o
         IABBHis81waaUFPBmevXPtGl0pJxjCQ+d9x8fN5Ya2LPuibqJWATUDqtFgALkZLDuGsa
         AAYPU8l6RekBmL3Nh5WbFvkgLPCx6jOKEDkNp+v1mTyDWrbRDclq2GvIFwUso9rvZ8rF
         DxiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uUPM1FRtLYkRBn4ScF1TWqtVSpfnIVcvY1GHVcyxTTzFHfzIQ1O3bunydMmvT9jttAfs=@kernel.org
X-Gm-Message-State: AOJu0YzESnNrrwIQZk4dSAMSQdXxSTmx3yRBXgLA0spFEmybeB5hBzxc
	rd5As8x8Q2GZ5x5Kgb1fX/qU+UWjY3qECkr7xWnk9gw7uJYq/RZ7H5vdgkkQc7zlTHc=
X-Gm-Gg: AfdE7cl4edm4ydW2OvRJLkbTP/5IHthX+XJK7XAOiDDI0jit86HBQTDLfbmzP9mAXxH
	AepLuPb+mcnY+d0sWTSc14TjZj9oz2Jt58GY8X8ut+DNIYXGj2pRJcwZNInzrQ5EA4N4yDhRbkh
	KimUV5OgTxV0ZcC4uCVM7lWQ5urJDVh/azTQgOkIlk3hP3noU3o3XrqnNwgsUc7FyFQ4cx71mD/
	k824wdL7gmSObg6T2W+jsG2Vo7PzR/lzoMWHBNHYo4wTTVQCIaiSDh1ox0ricWm4VGnKpAAPpsv
	O6Fk85PxNMgM7njyPiPmOYvFxgk2aqpV4vqG7XaclmbKn2HpG/EFjBbdpYmzlRkvDipJHnZdYft
	WO307eMMLcwoqzmsh5UblHJiphgY1G2DB6ChYUQVNM4VG7PAZvl9FRYIq0tr2UZb4Qd7A36Waib
	zbxSO+gNLCHViLzwopiSKXm4NiBhl8k7dZhA/uADA49Avk1X0zYFqpvHfNRE188luJ1npl0sdEx
	RDQwgIjWw==
X-Received: by 2002:a17:907:cb81:b0:bee:b5f2:6385 with SMTP id a640c23a62f3a-c097adb77b2mr704001366b.11.1782135315395;
        Mon, 22 Jun 2026 06:35:15 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e48ddsm374099366b.50.2026.06.22.06.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:35:14 -0700 (PDT)
Date: Mon, 22 Jun 2026 15:35:13 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE update for v7.2
Message-ID: <20260622133513.GA2789405@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this small patch updating my email address to a @kernel.org
address. I lose access to my Linaro address next week.

Thanks,
Jens

The following changes since commit 8cd9520d35a6c38db6567e97dd93b1f11f185dc6:

  Linux 7.1 (2026-06-14 15:58:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-update-for-v7.2

for you to fetch changes up to 314c243b201b678fa89226b1eaea51a71340454e:

  MAINTAINERS: .mailmap: update Jens Wiklander's email address (2026-06-22 15:24:51 +0200)

----------------------------------------------------------------
Update update Jens Wiklander's email address

----------------------------------------------------------------
Jens Wiklander (1):
      MAINTAINERS: .mailmap: update Jens Wiklander's email address

 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)
