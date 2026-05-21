Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549B3093D3
	for <soc@lists.linux.dev>; Thu, 21 May 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372931; cv=pass; b=OsL+mE6tD7P1Wps2KPbf8P8F6dy3IoNZ24c+dQQtdK3zPv8vU6DPc99rQO2DsHnjGdLKbr7Jrh7ObBu5l3w2CHgHWaN7gxuiEHnz7h39KoCvdRBFB5XmiNcEy8+zF5YZKkD7FNWj6dPB8u08z3q1HxIdE/7QkDPsHvn0IptwZys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372931; c=relaxed/simple;
	bh=OcunlAI2okb+Y9rCTNSIcCq8cCWHG+Kg6ltM8bzJghQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHGFQ0L4EmRO1rGScrP6zvOxrRTsymzSLCYAOVsOFRt+Tn/YBtTs+HFuI8JMzJxcD+AEBsej/gy5opza68xaxcItNiKj8D3/vVaALnJHwD79cNWME9A3cCSJZZi1bahTGPX7iUD4hGUwKPkhblh5uj5JSf0mPQ9gTwGCaPQllNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aj4k9/ZV; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aj4k9/ZV"
Received: by smtp.kernel.org (Postfix)
	id A1A721F00A3C; Thu, 21 May 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779372929;
	b=PDYTS/KcR033J3nPOFFDgDcoV6st/kso9dWXq+s8giml3rNHzUFpgwk/vVWX86R7zHzf
	 TikBOWhe/7vZ+FdliunSU67Qut1w058vSidAOwvDKvoKchULPkqyxf984PrFIPl5NhLwp
	 wepgPGZPpbaLcFy59JLSh1n0zLYhj2G4+DhsAiBIpAHuBWzxUDvejJf/c7c8c6JSHCO4X
	 UFM6pm52QwF4s0n2G+fLccpBwbez9OmloHLTotO4qXtk8+DPacG9yU3SzwyJpKd8OLKc5
	 rsgEKLWs4za1crPDLtzixevcP8/q0uzkz0h8VRH7i+4XTTw+0UbHe7KfNos9Wo5SHFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779372929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=NGBH5couJrf2+imLmZb6M8hd7uyW+GPRfAO1ovQLVjs=;
	b=oIFh75dak4XW7KJu5g5CYWkDXETgRNLW7/RvFgSMGBEkSyB0IHpr7muVdNHp0uFfVvXw
	 58hCcvR9IJNWz7SWh6twANcuKcEyhwZiLcsdylK7saaOQJSzKWT6WjEaPJwercVtb6SLK
	 duV5BITZxGz093w/NtA13aaoPiphgBU+06ZpKf+0ji5uAH1FuolA8v0YZWVGEnbZoKiHd
	 XzSNsIFqSU5vXAcJcU21F98agEtrPyC3RoPMHmXr730f1cO67cet3TYMcYKf337VslNBv
	 2cy5ADkSE89XWoKoRNTvDB4Fm/glbLxGcfCrV8ss1eayF5f8nADPL/TlDJ/E+OO5LdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="aj4k9/ZV";
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AE8F1F000E9
	for <soc@kernel.org>; Thu, 21 May 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aj4k9/ZV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0AE8F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e8292423fso42579771fa.0
        for <soc@kernel.org>; Thu, 21 May 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779372927; x=1779977727; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGBH5couJrf2+imLmZb6M8hd7uyW+GPRfAO1ovQLVjs=;
        b=aj4k9/ZVNG98vEgdAqTXme2nKAyhCfiUZvwR+81Zx1HDEE6o5TZxyWUn3OgpysOew8
         dJ2xE8HZy6jdeH2BgsFWV/l4u4xRrMIAPWy7Eo2fEJ33M++f6/EDszNS/2yZ7+1BZpKW
         KLwgsMNUTrUPkrYAEbkzYoeb2yG1gwvJDOjY5EzDb+MqYy8Dy4iahXpAcsMKDs35tBLi
         tW6g+weWFqWf5j56YrpJ0wBi8Yll5PJWd+qzplIEsf296L59O9+uf6LZZOUZwXQqrQl9
         zMREdACo7YNyQHplWtXb2JYTaNyNaBVKHRNIU0ndQ76+VrlrhiFh7S/EcY0d0aq6vJXH
         OTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372927; x=1779977727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGBH5couJrf2+imLmZb6M8hd7uyW+GPRfAO1ovQLVjs=;
        b=fwNUxrvYu2x/vOo/FByDfohZYHVU/Tb7VSfCKLDRU+Y9Ru/3/k/MvFIL1fc8N5rbBg
         z+NiUto7tBMyyOKvVzlwbz+BjvcH6YU4r7ndAznSaJ5GjHAG10SK2ssbvAd2WBAjVlfr
         wisNqPAVTSzYy4xIyKlpme1RisdKJEErD96XkvN4g+8Ul3DE/XaUZJaYGPh+5M7+ZQwF
         tpYEVakB04/imGGdD1KrIKkdTdFRRD86SD3sjPpceYWfDhpx3rI974+YRZB+hYeiNbK0
         0Q7O0r+DGIG7UdjLIKpxlFbpWDvAmLgc1t5erjVk/PCjohUJA83ZkhQOjOvhabCbX09E
         tlcQ==
X-Forwarded-Encrypted: i=1; AFNElJ89q2CA94mcJi5H6Sy1R+Hy2VFF3TTt2NRJMclQq4Qyl+7DI62LbszaWEH7KKnMXzR964g=@kernel.org
X-Gm-Message-State: AOJu0Yzq6hpRlonIz654+p4JQnH2aAD2f+Gp74r8Hn8KoGQ4F10Q2Hlm
	DWQTO9y8PmoyteJcfOfnnkt7Rbwsx2MYOj2EBi1CXQW54F1KjnjWU0TVJ5gZBybmPNw=
X-Gm-Gg: Acq92OGi8KLB4EC26KMnuiG4Il0/cwJpBY1itIf3U+XDfL+Z1TdoNDijX1TNBe6Dbbr
	E1ZypTsjVMeWxhTOMFstD5+4AMekh3OTJygy5OMi8KKtU0h+IH8Il21gjy9P5FwJtQFbR+S7CaH
	+U6omAhdRZ8LeQBIEegDCNB4m5nyobaSl/VUiDDiXo/4AVrMTLuyvgaSgikaCWL9uMLlP8HmsOz
	CNtXtkL4iPEwSO2celhLYV96DDhNndzN6EYBV54AaGa62IpiavFbzOA9b1f4Gi2savsdRC25cHr
	yhN9NqQygMtuNK6fNorTNCCOJVgp3/ZiuHV7RsCWN1ToEOgiplTWMGvBjW61r1Blja6nYMcbSdL
	qSFPJ78w3Np0blefsAWgz1i/KBjgItwRlI7yO2BgBHknT3rYnxAYm070ItFPWxbcpi689o5gUSk
	+Jfjo3kROtYgda136KLzCayY5Wyq1t/r3OaiN3ApH+4HAWSa6EEcYsnr8NWJUJ2IMysEsSSurW6
	W/gK2RezJ/l1YRI9wmlrC37sWxcFLc=
X-Received: by 2002:ac2:5312:0:b0:5aa:b6b:f6ef with SMTP id 2adb3069b0e04-5aa2ba9ab5amr902886e87.45.1779372927069;
        Thu, 21 May 2026 07:15:27 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2f14a417sm294444e87.58.2026.05.21.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:15:26 -0700 (PDT)
Date: Thu, 21 May 2026 16:15:22 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QCOMTEE fix for v7.1
Message-ID: <20260521141522.GB1708231@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this small fix for the QCOMTEE driver.

Thanks,
Jens

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-fix-for-v7.1

for you to fetch changes up to 471c18323dfdfe7844e193b896a9267ae23a1026:

  tee: qcomtee: add missing va_end in early return qcomtee_object_user_init() (2026-05-20 09:22:52 +0200)

----------------------------------------------------------------
QCOMTEE fix for v7.1

Adding a missing va_end in early return qcomtee_object_user_init()

----------------------------------------------------------------
Robertus Diawan Chris (1):
      tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()

 drivers/tee/qcomtee/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
