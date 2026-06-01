Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D172594B9
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344375; cv=none; b=upLjWPUifYo7YDRfb3lXpPrj1DZggNoKkdu77jyzcT5QEcdBwvEcmkY90R9LEhMVV07ckHlCZbGAdnqxraN8K5KWW+Dr/Cbj/JrHPOHEs2oMuwQR+rWaxDx8yk90XDrctLAm/enXOVvYFvC6y9F/Ambf4B8WLGDmoW5NRGa9XbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344375; c=relaxed/simple;
	bh=tPp08SqgvWIL/cXEIjMePhCNGm+zdimnhyqsKAc4Zls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvKRnWY4OpIcgbQOkAG81emxYUHnek8gwt58ULBTBAsTxu2A1eb0aJRP9U8wsQg6LwZNsgv94LI1k9UgmPx5C+YaUH4dByWMq6lmrpBPWETv+Cdf29KGT7UN1fHI4UR3qSzryAtUgKqA/Qlnm5car31gEJWyBr7P94QKgJaJEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLQxdGdN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLQxdGdN"
Received: by smtp.kernel.org (Postfix)
	id 539C91F0089C; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6701F00899
	for <soc@kernel.org>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344374;
	bh=s14BrCNKw5biHzAbTs/7/BHxIivmPKRyhGyt3zFJ42s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kLQxdGdNOe4WAEbHBkITeF72kb2AlxBmTVmE3SUR+hxPNzSrxMJ3Dc2M8M3fwuDhb
	 dMA+dyw0besE/LJl+JFci2ecBZdwLXJJZGxXRrkuJZMNIUUTCF2nHBuDrLlLHIGvwp
	 1x3YsaXmjrQt2XDXtF3TV5gijfYdJq52cj2KoouXuMbbzvE2AOxMLEtQk2HB13VbfD
	 LUYlJvdW0+ZLC0IdPNdLNIppnxjLDAvwdNlAec2Oc1VPhxr4OUIZFhZBMt2zakDqjX
	 FKiliHyUxtDVmdvCqgyx8TGYSIga8SqoYqU7l0ywT/PQJGktU0i7Dj1qKwIgrXLtcy
	 Ct35td3mH45zg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso1775304e87.2
        for <soc@kernel.org>; Mon, 01 Jun 2026 13:06:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YxX3qYoQCzTDMQHjqhHWKkti0kPCSw+dxlRpoIYrKgiqDSUbhQD
	hX/okwA9CpahvmdtgSlKNPFoTF52WywLbjwZQa3degoBuariPKlG19vpduiUNzvYvgjMeAxidlY
	5bf1OAg0xP2e9yq21qooAsvY+UY9OSQQ=
X-Received: by 2002:a05:6512:1250:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aa6cfc7c86mr1598474e87.2.1780344373039; Mon, 01 Jun 2026
 13:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
In-Reply-To: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 22:06:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
X-Gm-Features: AVHnY4K0SnpwSd7TlxazfH13zL4pKXTV_yuQj-jItkV28NmyUihecMzf4bInR58
Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

thanks for your pull request!

On Thu, May 21, 2026 at 3:19=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

>        arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property

This commit has a problematic Fixes:

commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
Date:   Mon Mar 30 14:11:21 2026 +0200

    arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property

    Fix introduced invalid property for Khadas VIM4 sdcard regulator.

    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
allowed ('enable-active-low' was unexpected)

    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp=
@intel.com/
    Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
power regulators")
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
    Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
    Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228c5=
1c8de93@aliel.fr
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
tree.

What's up here, it looks incorrect?

Can you look into it?

Yours,
Linus Walleij
