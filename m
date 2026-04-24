Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECF361DB0
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013546; cv=none; b=Uji9giMfO0JdzHAVmgAAaT5MmTAOxT8T7OTtcdDelKucHG+ORl1zMETlFbl03AKuVswZrpF/1nKzWY2tWWC2FZP5tnR5ctfZzkimellg3xTG+htDpC5mvHli+THfYG3fI/M4dVD6jZ/UOfkIphNH/Ntjjoqzjv/LwC95/GSEL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013546; c=relaxed/simple;
	bh=nRJOP0j3XKc9GVJLe/zZOWTB37EaZHVbmNEGogY9PsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+MKWgkvxc2HWcRjEhNdWVCpo4tV8JzKKfD6Oyzz9Htd4aDYX6dqFRIqb1tyicBf7m0Uq7L+alLx3e87HHRatpeDOXFmIiirXl39qIoBoYVoHAlPcb+K38zUJ0oPkdxdEfZ1WR5XvZLNaPQK8iJ7ywhaOaTJmtthx3A3lSoYGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOikG9eJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOikG9eJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA9EC2BCB7
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013546;
	bh=nRJOP0j3XKc9GVJLe/zZOWTB37EaZHVbmNEGogY9PsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hOikG9eJKV2Lv8Rn+NieIPb+7w1cDLf8PS6wRdE54D5aD2/+gorw7crcQ4FmNz+dI
	 nupGE8B+R+42EF8fNFIeMq1Yh2/tmh4o0DadhfLyWfaWLdHrUl9dSPwfzF2KLuDPB5
	 QlivInoNaJtf9dPB7M+ImQk2qFDMiKOfP5zRsZL0Dv/e7ucSxMMBpqjjABN6K0DNzM
	 boOZTAqEkVYPS+8xVBolHlGHnsUVktNvZKkNqppALex7Z4Fn6MhlbJOXHwfwLxGfKj
	 aKmm6LyN4hjAswhJdKAoiEQ1DBEN2oByvgCrBo6FDCiuR46LeRbhBfvi43MSDOdia2
	 vZJcr5arrmrMQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so8201085e87.0
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92R6Pr7YdqcM7D1LVjKon3HQM+MR/F3m1sbE+23/q31AGmPfc3VaXk9TrD7xL6LyacMtw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxkaq+31intVnOrSH2si1wfnecaoOi3P3X2xdrQgwjywb6hlrW
	QKuzuxC1j98ytRc2kqr//QYW8s8gtyrfdB8ZK0FI66jz20CfLjjsIIsqB3eq6FExUj54fDBuViz
	39lUyn5iCR1TncEwQ97oAz70nP6TQFCg=
X-Received: by 2002:a05:6512:2308:b0:5a4:74e:5f89 with SMTP id
 2adb3069b0e04-5a4172e1c0emr9146746e87.26.1777013544781; Thu, 23 Apr 2026
 23:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-1-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-1-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=ajhfHfsbQUDyepOaRviuPCjdeHdXKzvk4Yc8m5BSDQ@mail.gmail.com>
X-Gm-Features: AQROBzBYgKSFBKf2d7KO64mzd1gjg_XRv4U5aJq5vG1so1gyNy_IrLTtK12mfak
Message-ID: <CAD++jLk=ajhfHfsbQUDyepOaRviuPCjdeHdXKzvk4Yc8m5BSDQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: Move entries to match savedefconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Only re-shuffle entries to match savedefconfig, without removing any
> symbols.  This helps in reviewing defconfig when comparing with
> savedefconfig and looking for obsolete symbols.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
