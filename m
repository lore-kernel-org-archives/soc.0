Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9D25B0AA
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856953; cv=none; b=ZcrPNchoqFcU4WJZJAE4in/Qiuu5h0zCTkIlPLPDMGG7fjRnHNK6PjOK7vyA9q91l5JDh1q62R8NvAmxADn2aUfF3MT3bqBUCXy6AGA0aqo89TJ9egdY3FMAaV1pw9Snc7bK1PZXFHgki0wCvNpL7uPnJeRU0vfxXPOgzksodC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856953; c=relaxed/simple;
	bh=SbWsvBRl77AG9MCJIlpQInw21iowjvGOZbJ5qlEQMlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YP0IOoWUzvtSN7bbwILM+sW96vwuX50148G5uNR1oNaq3yzjU76KFRNg8Gy+IBFPdZ5shIBCNfUyxBMbZl8zBxl4uPDHtWwLnhXWMP25XHMlXnZ8n0HSJD5ZddGHzyKxIGlr0kHi2GheT+C4NHR2LbvUSBlWsd9KCkMHTGwQet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNakY8Aa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNakY8Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AEF1F00898;
	Thu,  1 Oct 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856952;
	bh=CT4kb2NC2GIwoaQlNND2e1KhaSxMkjUX4wrMV3NGkt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNakY8Aa4wTesYELLOj6I5NEHRUu5JXo64JQKGBSaU+kVwvAJQm1htfFj6FsLUVb6
	 rWxVS9cNdDPm3zkGGZQXrZ1uZnPD+QUj1dZfzAAnss+uMmQRujEBPivdRB++w51/hQ
	 4EDN73hmPf3VWd2FGKILxh3tRSZq8bI9obV1C0hMQjglPM8NCtqwK+nLGMG2prMLVD
	 mC1ym7TEfjQ17d1Zh3SwmRYevJehpDRWenDHEQssJDUc90TZ7Fyo/p7KNr+OE+VUyF
	 BbqqiEz/eObzXughYz2BsDaW5nU8Ws7+llobBQYtKGW+LuDpcizUK6VtBMOx2W4M2Q
	 iGdSPhvrxEeRg==
Date: Thu, 1 Oct 2026 14:15:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
Message-ID: <20261001-striped-polar-tuatara-d66794@quoll>
References: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>

On Wed, Sep 23, 2026 at 07:38:44PM +0200, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> please pull these DTS changes for Ux500 for the v7.4 kernel
> cycle.

Please investigate your client so:

> 
> Yours,
> Linus Walleij
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/ux500-dts-for-7.4

this line won't be wrapped.

> 
> for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:
> 
>   ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)
> 
> ----------------------------------------------------------------
> Ux500 DTS changed for the v7.4 kernel:
> 
> - Make panel regulators have unique names, duplicates found
>   when trying to use the DTS with U-Boot.
> 
> - Harmonize the GPIO key names, as U-Boot want to have a
>   device-neutral key name to look for.
> 
> - Add the Imagis ISA haptic feedback to the Gavini and
>   Janice DTS files.
> 
> - Add proper regulator defines found when working on the
>   proper power domains. (Bindings are in the regulator
>   tree.)
> 
> - Switch the audio to using the generic audio-graph-card2
>   binding and drop the old custom binding. (Binding patches
>   are ACKed and will get merged to ASoC and MFD trees.)
> 
> ----------------------------------------------------------------
> Linus Walleij (9):
>       ARM: dts: ux500: Make panel regulators have unique names
>       ARM: dts: ux500: Harmonize GPIO key names
>       ARM: dts: ux500: Add the Imagis ISA to Janice DTS
>       ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
>       ARM: dts: ux500: Add new AB8500/AB8505 regulators
>       ARM: dts: ux500: Fix up regulator assignments
>       ARM: dts: ux500: Add sound DAI provider cells
>       ARM: dts: ux500: Convert HREF audio to audio-graph-card2
>       ARM: dts: ux500: Add Samsung phone audio graphs

None of this was in next:

Days in linux-next:
----------------------------------------
 0 | +++++++++ (9)

Commits with 0 days in linux-next (9 of 9: 100.0%):

What happened?

Best regards,
Krzysztof

