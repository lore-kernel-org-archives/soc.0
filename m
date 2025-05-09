Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36203246760
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825783; cv=none; b=W/uXb+aPpH1vcmZC9b3qzCBSPlVD9u2iEaLf8Gopfs9+Hgz4hshMCf6FY/v+gTwY0U3mR0+BTSsyrcLUfXKsmj55bwk/yBHGeivd+PS/DuilleI3m5FXzxh8HIaZ8E24TRls3mMmgOdp2EgfoRpK3nrqRRGJCX+HEWxqUhIxSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825783; c=relaxed/simple;
	bh=UQ0qlo+cumKX79UwBgG9XqDTrOvjRxyPzj5vvdhGBQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVFGCRzwtA6uvuzI5JMvU334yA+G111GPc3+tUVQMg2Eyq+80Q7FXs+KbmAUkz3pAcMjj93ra9Qonvbe8tb8YciT2lTCyp2pXPx4C1fE+Sog6gpkjxtHjgLjSblU9Y8oURkMM/SwYXrNQhcCLGCvFnWh1jN4B5y64ADRerWU5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=onC8huWL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="onC8huWL"
Received: by smtp.kernel.org (Postfix)
	id B5A48C4CEEB; Fri,  9 May 2025 21:23:02 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0530C4CEEE
	for <soc@kernel.org>; Fri,  9 May 2025 21:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0530C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf1365b1fso2701a12.0
        for <soc@kernel.org>; Fri, 09 May 2025 14:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746825780; x=1747430580; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmMe3vW4lyNfWDou+q4L04WRl287TtyiakNs3hFn5BI=;
        b=onC8huWL5sdrTkbweopMO+lY3LYC1ScpJcGvZYN6ikavUQjsPT+qj7qmtTiHX2UtHK
         E0uH8BSz+WgSZBgpsPrF/nqrDF5dyKhg9wi6Q+Nic/jKGMtD+ZuLY4kze0Q5HLIY7X/h
         d2bp2GfCiBGql0AD3XWDFHSVLDg9ZNxC0O0ulPQXr+wkTfTH3di0TgJzYRptZx9H2KMX
         Ag9is4uWqwZt87kzlDrDnzGP1c1KzgtiV0CD7+USPWcaKXEqQi7DhFehGEi9WkDsVEqB
         2INQuigvsUBFRPMY5raItpdbVGXNVKL9gUOG8I394C3RPRgH1ui+s6u8KSkqwrjC7Rn/
         YPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746825780; x=1747430580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmMe3vW4lyNfWDou+q4L04WRl287TtyiakNs3hFn5BI=;
        b=MR+n4A17rCF69C8HEt42RE0HSjuUQ81C29bI7hCrNQbI9IsRlIHEqY7kxCtM1+4cpV
         Gbcte0cPDR+Kt+efOaCTV9TXDXmXTXdrYNJ3XwJBH36T8PFWctOmLVw7mTFE5Ob0mXGl
         8QmHe5kS8q72Ek1157s6EjwkRgJje3rTu8Lg7JVtPY0laoIqERSoNasS/tSr4m2gCEGH
         FM9/YggLm+5WhEUZcbmnpMGtN+IjhMYqf7DXWaXkN6drmwW5FmEEvY4LVylIrCTaX9Sd
         GJUp/jokAy1V+YoabkNV5erX7RcRoA74ftWBOXWKBUUf49I1MCsmZya0YqQijFVt4CmJ
         vs7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+0UTpw+JnhwHdKNKBH0otyQ/iMYm3msGmOVSRUXyIO0r3vKQBe6vff9GvcG1cMQZTblo=@kernel.org
X-Gm-Message-State: AOJu0YyVGqcLVfMCNq1sOADf2L/YqOrWM6W6envyVBHpv8EFidgpIwIR
	plk+f8RwnMJu6FegbstzUFtD/U4ENhrM2LAg3VmLWHqJFC3Qp9gfhXdofkVieInsW4F5vkmIwlO
	l41JrtTHJA0HCtLfsh6XpPYprihnptJxdeIyGXaMxr3klodaaD35h
X-Gm-Gg: ASbGncvR6oY2cAtdnSJs6IifT4ljRpvdqbgZg+zNeUPanXOPJLgQSLOz+yQVu9pVMgi
	dc5AcEZ1vvSHZVospV+fHBdAuNlBMEEaIKvUv/vJN7MTRNa2otQ8g1FrQaX74LA9YTTpR82PcQ9
	/j8Quye7Ec0VBW0RDXE/zBwev9Prtcs4XkjtoVndds1idQ7cpI9buKxik+PFJNWdTlUm3alOc=
X-Google-Smtp-Source: AGHT+IHPOsOvytyLoZXJ/HaSBzGBFJQlrpcSUA8p8mo1k/cvAVzVFj/B+CSFdZdMT22Ya7LNJGNu3LBrPqnGNFjb6mM=
X-Received: by 2002:a05:6402:c98:b0:5f8:d6b1:71ba with SMTP id
 4fb4d7f45d1cf-5fcca38de61mr24137a12.4.1746825779809; Fri, 09 May 2025
 14:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509065114.GA4188600@rayden> <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
In-Reply-To: <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 9 May 2025 23:22:23 +0200
X-Gm-Features: AX0GCFuHNx6MvLb6u653mJm9uz3oiL-dR9aPw7rOMiTgfkX9j4rJTsW5oesdTl4
Message-ID: <CAG48ez3JEg11GZTzmSHeXEDVz9vN68vWjTH+2sq_6+8eK0zkig@mail.gmail.com>
Subject: Re: [GIT PULL] TEE updates for 6.16
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, arm <arm@kernel.org>, soc@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:14=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Fri, May 9, 2025, at 08:51, Jens Wiklander wrote:
> > ----------------------------------------------------------------
> > Small TEE updates for v6.16
> >
> > - Remove an unnecessary NULL check before release_firmware() in the
> >   OP-TEE driver
> > - Prevent a size wrap in the TEE subsystem. The wrap would have been ca=
ught
> >   later in the code so no security consequences.
> >
> > ----------------------------------------------------------------
> > Chen Ni (1):
> >       tee: optee: smc: remove unnecessary NULL check before release_fir=
mware()
> >
> > Jann Horn (1):
> >       tee: Prevent size calculation wraparound on 32-bit kernels
> >
>
> The second patch looks like it should be a bugfix for 6.15 instead,
> any reason to have it only in 6.16?

FWIW, it's more of a cleanup than a real bugfix; there is an unsigned
integer wraparound, but if that occurs, we're guaranteed to hit a
memory allocation bailout pretty much immediately afterwards. So I
think putting it in 6.16 is reasonable.
