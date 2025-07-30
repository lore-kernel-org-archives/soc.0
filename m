Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E8226D04
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913402; cv=none; b=Zyx9DuPb+JvG72RyQ59Ik0fGgyqhwex49iNGZhblfjzhQqJOrO4ElYukumEqZObLJOg8OD1ELmEaMLts/+7WqN9K6tJl68sjNGw1K/LvKX396O9wbK1vC3Md3RXUSUMMnypAqUMnFR0NCeSwnNfg819Efx/WBDhpKvXGn8e2LiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913402; c=relaxed/simple;
	bh=h5cJJQbHdQaTXKh51DQ5Re0YcAkiLbnVXJhRdDuB/C4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kcbOvs0T5smNtKrGcDB3dcQ+NgHJCLV/yDNsTnN/cfha3yUdva0Cu+ISIvsA7LpJpdCv+8crZ1SlaXscclOMme0lOn/1jdUNu49cahF8I8Q9NnyFs9MYbqTCkcAE6Osm8aV0UUlPKg7JZHCFRMyqcL3gg2pIFztugs6ZEiskG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ufUAQ6Qm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ufUAQ6Qm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7494999de5cso193602b3a.3
        for <soc@lists.linux.dev>; Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753913399; x=1754518199; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=ufUAQ6QmY1s7lxhtKuenMdK7ds0RKcIIQccjvzpSM+JXibbe++xWlJ3+BhSnFpEEWZ
         NrUcd2fTbepT06H6qk1d9wteNiKs+njWaFolla0k9K8AZeKGhK6m/6diHwGduvIJtpwx
         /qiOBE1h74Qsyg6ymJwaNSZZt7VUXUME0IVFAxiboJY+XeoiC71LX0X0QoqBchv0Wibr
         UnqAmn5crECkEBOfjkQ3LLjoZQLKrE+FFhO4ERidl3vkCZZ4P0qS7godSl3AKJp+OEPf
         DYVfpreuT3l7tOwPoy5ohwptuIm0BFG/Q0ETYZ6ppN2fLtJOoxjbMpqAUbc//N/b/vtt
         tugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753913399; x=1754518199;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=xJIEhiZSu6Jbyo14NNXLAEpPhDR6+9s5evOnaMDN0Nn2Qnfoth6CDVNQul16w9W0sd
         qmBQwxEmIwGe8SWIH4g4luDa8QwcB34HyNtYui8I+7TywPdGToT2/8fn+3/9ilwr9pUm
         CGNhRw8riBoT5niKf2owK13pLZ9kLJvYmxEToc+EvIvgv7udNBQQPyFHsrupjTczU6bE
         GxYgin8S1ufYQCEMLHqEby4+2xIkwrcr75pMaYo+M+8NQgotLVJMeUO5zbn6/tfQUJ1A
         oCU7JdH+8zN0Sq81s2D9OQqObM+t/w6SC6W4sBWTTCE7QpGjzkXc83j+VvPZbHoEeLQy
         XsOg==
X-Forwarded-Encrypted: i=1; AJvYcCUuSojY9Zp8jR+7LM7HdmKZFICJep6YlkZ+pQSeUVy5oQTC+qK0UCjrIcLJwn6aDUOQN6w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnyEbpEJMXbU9LYHiqTA5v3c2bc57IZDgcCeix0oz0q68/wIiR
	Dh3NkI8mY1srcF6XyUnMEXJ4iKaFFGZHafVf8pLkB1V92TMc0yfN8x9Uvloo4kslEGg=
X-Gm-Gg: ASbGncsaNWJLdo4+umnmTNep1TiBObvuvBfg7qDI60hAFKsxrOWLCeUkG7qlo1+Zc6d
	se9GPO080DP2DmQ9Dqs2kpBDYCDuRF9qVru683srKK1wFU13nDvWV5OaG/tAExrPIzwAu51UT75
	Jl53DxPuU3QGJp9uUewoIzfPZ1M3IDRqwilCrXoWcOVESDo0WzV+XaT2Boj7M2VIVO4j9+F6IJZ
	qUXctS6DAxoayJRLBk0fgO1cVQ7JOHctFpaokx1+swxguUTKOJ3HjE1Snm1cAgjboMLkC0PDEAF
	z3xve0dZQY6cM54xSsxg0OVQGc0LMcyeO/M40z7IpLCvXlDpwQb5jXrN61RuSLYPfGvlLtC9vaX
	DCcZK89I3edXJ8zrV3+sC
X-Google-Smtp-Source: AGHT+IG2Jmy1RxV6oBn2xGkRgnttbrjqStwBdj8OoNSVMvlZtpFrHbZ+yOlxDoOXh/Si7e4z6KNvHw==
X-Received: by 2002:a05:6300:8054:b0:23d:c9d4:8634 with SMTP id adf61e73a8af0-23dc9d49682mr4388168637.16.1753913399278;
        Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb18834sm42944a12.64.2025.07.30.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:09:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] soc: OMAP updates for v6.17
In-Reply-To: <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
References: <7h34b4xcxb.fsf@baylibre.com>
 <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
Date: Wed, 30 Jul 2025 15:09:58 -0700
Message-ID: <7hwm7pbaa1.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Jul 10, 2025, at 17:50, Kevin Hilman wrote:
>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>
>> ----------------------------------------------------------------
>> Kory Maincent (2):
>>       arm: omap2plus_defconfig: Enable TPS65219 regulator
>>       arm: multi_v7_defconfig: Enable TPS65219 regulator
>>
>> Li Jun (1):
>>       bus: del unnecessary init var
>
> Unfortunately these are changes that I really want in separate
> branches, for defconfig and drivers respectively.

OK, noted for the future.

> Since all three changes are trivial, I ended up cherry-picking
> the commits to where I want them. I hope that's ok with you,
> let me know if you need the stable commit IDs.

Yes, fine with me.  Thanks for the update.

Kevin
