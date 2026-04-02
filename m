Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3237FF43
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168759; cv=none; b=TsXYnDVp7HIxPxxSOA3YS977LraRVpox65Enxo2gTbdCiRJd9c8uw1G98pGwMmyefDOvzAFtt7qpYVK8+TrnHhttLQQTCsXAktezHdi1/8cCqq1IWXLXj9KJd5C8lf5ygSX1NJD8cQwgRX5XRwBOovXbKJbfbv8b4UDLXPxgzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168759; c=relaxed/simple;
	bh=gZ93mT8V+cAjYiB9BrP3gKMHvgP6imQkqZzt4qDVlkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeIxrCJJfIiSdDDPrLUvjb1bDXEyTlltL/O8S81gqX29Pm2xPOFimlvqPxklDaNRY9mVFWQc2suoZ6aFwRGAuEkquMkaqwXfBEoQ4mkXNhzrNgROdS8PEAw1Lr/7WZLm0bi1WNXdZ5f6JxkUivrpYilS1PyRJ/9Km/WNObRPdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qxh2hBfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qxh2hBfF"
Received: by smtp.kernel.org (Postfix)
	id BC72EC19424; Thu,  2 Apr 2026 22:25:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1147BC2BCAF
	for <soc@kernel.org>; Thu,  2 Apr 2026 22:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1147BC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82735a41920so478328b3a.2
        for <soc@kernel.org>; Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775168757; x=1775773557; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=Qxh2hBfFBRfswoQb+mK/c2Dot8GpRMPGsVTMgQGWjUqADG4oDKj7XwFJWWGJDYUhDk
         0MpI+rbyvJhrIkow3+WXzWBvQ/G63u7D4lA0J9zQiZT2wsaX2JiMJ9zfzvoOeasustaR
         k+eNDn7D9tAlm3M6FAAT2vrDB72bFltkMxKUJjXuTiqfQ2aGr/Ln2AF/vmaeQY56cD0x
         fFaPvzD5k8N9PHW1J+3JiYF5JV/zeLLDQnSl+HCPeUnJJeD5kK5EtufHBqpw3pwYyIuY
         Rbjpl73c7yIYrRdaB/TJO0GGE9EC/tJuS99grMso0QgpbYk0W/GZJcidE4b9aL3SF94z
         niIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775168757; x=1775773557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=rbK+X9K3XpGVIqfbvcb0+TE/8xf0Y+G9tiFuajqHut99/w3j18lcvRuM4Gm6QY2P+T
         Um4Bc0NHXsUdhsEnEZvQfHbOYQWp7ay7Rl54sAswrcRZ4L92Orkfvgzt3J5hhd06vw88
         vRyeGI2wmVgzidkhPkxdxu8pFRGrg0X56h4m76wAxbbHUPH75EonO8DPtO3MKbwiEJ/+
         e55VCrcwIRfzo4HrQ5hjEFHp17P1ZOelwfymlHn1JqSH6pax0z20ygxEZBj0GXULj3SP
         35c0w7AIetMNt9QDAa2AJSjnNwCYHIkDImW9DCzCMQRlVTVXESxml7ToJN/8YULIP104
         fB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh42rxhIeDdfXBkwfwMDEIxlSMkqPDyiI0pnSnVWg4dfpkHdDES6/ptZ7WmGFK/h9IyPE=@kernel.org
X-Gm-Message-State: AOJu0YxVqoJ+SFdhhZrwAnow/NX1KcMN8jrfGC4cXdbMTDs0bQVWrCzz
	RgP3a8Ds6dluG2C94jMxA5Vp5dWh9T+8BIj8rN4dS3x0aWINcTB+GQ53
X-Gm-Gg: ATEYQzyGeQICWkdYn+GgUbOx1VjOjCzZddx7TqkLJjINP8yC7kPwnOVOuR0Qa1wRSx7
	y8WqHpv2J869CBZJnytKyOTeDQFoqXDhWo32PcDOoUflKzQnugSDzfj/qVDEJ719MHqt0maPr81
	77qwhv6UiGOT4ttQyucbsi2yGPw+QThBcrcHMHGZq4RD7H+A+w8aFgMirrzkq7h9O1jrB97c98t
	0ayL2nUOYPqWX5FaSR5+KxX5BPsw/SLeg6WMi7A76r3DLiGFfE0k+UKso8+zyjYrkCLuq3aofxU
	15XxHYPvN9GpweSCqTawS4G8vduRzDUgbV5kd02d7BQgzxsAxgxjwkHuuLLhfnW88hqG1Xd0tbz
	z0PEI1GeMVKIiKnwovthucbLEb2IQk184FGwTFZBOvMFk4mkJ7jSCpvDpzd3AKz1hQj3V03dlD6
	22Kw77smpaMEvXnLUzqErTnoNeLd9GNKiPNA==
X-Received: by 2002:a05:6a00:a0b:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-82d0da4594cmr742546b3a.1.1775168757075;
        Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm4338596b3a.40.2026.04.02.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 15:25:56 -0700 (PDT)
Date: Fri, 3 Apr 2026 06:25:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <ac7rV0xGGVmxT-V4@inochi.infowork>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>

On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> > For CV18xx serials:
> > Just a minor patch to replace the compatible for
> > dma-controller to allow setting DMA channel number.
> > New bindings and driver part change are picked by
> > DMA subsytem and this patch handles the left dts
> > part change.
> >
> > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> >
> > ----------------------------------------------------------------
> > Inochi Amaoto (1):
> >        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> > channel number for DMA controller
> 
> Doesn't this change break backwards compatibility with
> all existing kernels?
> 

It will break if a old kernel with the new dtb. But I
think this will break nothing since the DMA device is not
used by any devices in the old DTB. And if a user force
the some device with DMA in the old version, it is just
not functional and lead to a broken system.

> I did not take this one for now, need clarification, or
> a new patch that keeps the old compatible string along
> with the new one, if that is possible.
> 
>        Arnd

Regards,
Inochi
