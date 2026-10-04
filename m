Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01698370D79
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791110991; cv=none; b=qGm0HnjVfDhRPEHnXHWo1xvisjGtc70hNGKl04jsD8E9tFTfnvVWYv5Xh9iPNbFSN2YQZ+7yeNGvl+k9ytaVtMA28JIdPhrgOhbT7v7CD66h2TVzmpnRqzxIBGo1vQILz+zF83zRBt4Gl550ssZXBerkqF62py1Rs301h7cSp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791110991; c=relaxed/simple;
	bh=0sS21tKeHA/XwhStFzeJ0lcocs5Cwu00jA261kcS/gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhEKEaC9tkHsPLGRR5CIYTm3/pOaT2tiMvn0zQPk0cOBTPdtFAuY9HD7rTytcWMWxMEuVFTjgm01NI7z4wi1cbo2wK67JUhu1zraue9nXqv8b4Ku32hYSrWKbKI010pJd5Txn852LvDX5EbdziaQHT4roaFEBnGc8cWelnZ646E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiBiJu80; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiBiJu80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3511F000FF;
	Sun,  4 Oct 2026 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791110986;
	bh=B5TeRiFomRPiH2Rt1ToI5y/5WUyvgAV1QFHmdchXCwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TiBiJu80QCaea3papgq64aZiw/5RamxmDxL/0LiFvpOG9T/37TwQ6A+5rAT49TsFO
	 D5/PkHj5RMgOrdD30PlCysTi2PH8XRnT6jkmO7CCsUxkpFMhdefR7ESNz7SdJjTRIA
	 zUSp7IkGuA2GvrceD0CvqpTZEgSpwpm/aaTbNNDhca9V6A4ZatZzNtYDwQahR7PXin
	 agx8ua6tt1lkMohqQDVb92frE5aMMWpog6wiYkv8Ywa98SlDync3xV86ECvBq4A0Y9
	 3k1L9x98qsuRsbDeoZwUcOGWavaKFxfk+F+INPYGumLkw0zeL593sMPDqv7DvXzXch
	 ciorDeOh9qPOg==
Date: Sun, 4 Oct 2026 12:49:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
Message-ID: <20261004-robust-quaint-cheetah-7a06e9@quoll>
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
> 
> for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

Thanks, applied

Best regards,
Krzysztof

