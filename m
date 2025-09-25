Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659835940
	for <soc@lists.linux.dev>; Thu, 25 Sep 2025 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832250; cv=none; b=I4iHzFeRAULQP0Cf1HKi9eqfJG5HRlonjuiV22E1MbkOT85SvYmHCts/0XiKtPnTXA11+blPk1+x05kynVatuLZYelypFKx6NPh2ANIpV1i15tHJtay8J4TKqY4XixErQofWwu7KZn5c2NvjoQswDkpdBb2xg2ONijkmpXbeiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832250; c=relaxed/simple;
	bh=zdQFlyFtcJGHLR3n1F7B85z1BwCtD76Pv4Q5/J3RMhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3abQM5/RMOCgv9OKsI36v5e8VcOfa3g8b8NQVSKSwTw4KkplKFcOf1XCRB5ripJKBL5nM0bEmSSSSgU9+Fbi7JARgbXEuQ85H4m2TuxKTFIRHinblmqQiNzEzE1Mqgcy1RLQrNEfXk+WhkaHNLNNqwc4pX3HAwfeGFF+lZZjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6iepp1a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6iepp1a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e29d65728so9346705e9.3
        for <soc@lists.linux.dev>; Thu, 25 Sep 2025 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832247; x=1759437047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCkZb6qonleX8R/f+hgTPmeir/ympFYBeTfUCEgU1Tk=;
        b=I6iepp1ac8WcKvypTTWrRlzKHMtKyXgV/IotI09KsIbbG/DYTmzM99K590W6ZLobw4
         1aesDkyBA+/MuwJEEgAoG+C+FWt0mvFqMYMCp4On8GHCR27ygDou/QoIToB1L5ddgZWn
         fwXCl5Wz6SMmJZ5RK14XS44ukpvtWeBdf2eNYob7DEYQwq1YRnUlMyPjSsjHJGA/rAnV
         cHXBvKtxb7CvuGMzUalJaIMcyZ3fX8jx6PZVdE6K1K/5/pWV+/3reMGs0BqGySIgbTv+
         Uy3hgrY5Hp70OB4qZDRYgNAS0DWvcaZnfkxvRrrnbU0C+4ECOf2rqopyDFhXtNWFCCRF
         kCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832247; x=1759437047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCkZb6qonleX8R/f+hgTPmeir/ympFYBeTfUCEgU1Tk=;
        b=P5IxeU4bOFCCTc1qsxioruD+9Z+tJhN4RNPkqgcvZ7stW+KyCll9X3ivS4U6vQP9kk
         ippmUfV4GF6Xo0cVeFWYlOkR9CEbdxvAkmkN2dW278jT0IhyqONZQm+gDPUbnWiIS2XW
         5qz0OOTaVtB+3r7+MsKYLutMHObkU8avFr+T+sJQaoBgl5UttHK7O4kdrkRnwQNIpHSx
         zVZ+S2MYxezVZHW6yWoAt6VKLKX1f2Zwit01bGV+QwY6U7uxwtpHX95YfJGuPMF8OjzO
         vBZeOSdgk0uY3Fzn6Oil0QewNSXbmrD/YOVOWmVGcCabkI/9G821Je907B8WkcrWiivl
         TNeg==
X-Gm-Message-State: AOJu0YxKNmKjNU+3CVz+dLfd+24MeQQqkLFBDcEGgdBQjpO1Nx0/7ZMR
	Ep/UZkb4hljPwtF4sntnRaQtw2x2upDJ8Uv2wMYHHxym0ptM7zwepjc+oaTA5853zC0=
X-Gm-Gg: ASbGncvEZKBOVecaP3I1tq252HFBArN3Dh9Ofb+NxW0eFk+5nDVeNcNO2T6UMARgVtK
	A5RgV1jVUHRf2QZi3t4slM4ii9vJKdiUM1tBH0398NUGFZPF28zNpiNaIeaujvCX27KmcRM8nMy
	eEgxPomnukeDuoIJbyVOGq1cs8lucFLip3BpDBarNJ7kr7CWJuMueQ4r3ZerWiHVFtT3nTY8T4a
	L7oMvJ2vPgDiph8EYicgNcysIpNUASAslSgZUgW28/XLeg/FCArbTDlVfbeL5F3rjEY5ivqLfTy
	GwhgU+WBdBQcBCBlEY5/SYNtRw++itbv4Z92E07wQeVRxYEDOpn9bzdW2vWAO+AL8JyS4wsl++K
	ygLiYxQjMrLXKWs0SYDCuq0x8Bhd4qTW59+uvbE1V
X-Google-Smtp-Source: AGHT+IF7tg4RCzm9amlg/Gw/9ESY2ELu0mfn9+u3GRg5rzK8YPUdHN3cvSLydE0mJdxjQiAumcfhYA==
X-Received: by 2002:a05:6000:25c3:b0:3ec:6259:5096 with SMTP id ffacd0b85a97d-40e45b8770fmr4070695f8f.21.1758832246817;
        Thu, 25 Sep 2025 13:30:46 -0700 (PDT)
Received: from radijator.localnet ([93.140.105.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc82f2ff6sm4137336f8f.56.2025.09.25.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:30:46 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] PXA1908 DT changes for 6.18
Date: Thu, 25 Sep 2025 22:30:44 +0200
Message-ID: <2398680.ElGaqSPkdT@radijator>
In-Reply-To: <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
References:
 <4685744.LvFx2qVVIh@radijator>
 <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd,

On Wednesday, 24 September 2025 23:41:17 Central European Summer Time Arnd 
Bergmann wrote:
> If you can send an updated pull request based on -rc1, I'll
> try to do find the time to merge that, otherwise please
> rebase on 6.18-rc1 once that is out.

I don't want to rush anything, I'd rather wait until after the v6.18 merge 
window then unless the merge itself is very trivial.

My only question then would be whether I could still target v6.18 or would 
that postpone the series for v6.19? I don't really mind the latter, I'd just 
like to know.

Regards,
--
Duje


