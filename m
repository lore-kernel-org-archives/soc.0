Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504711DC985
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759783; cv=none; b=syys7OUqNLw5EF+qpvl8WzALV5ijgb9m7a78wmaRUv+7hmyfIvAwzKbeIh6OxoQsqmYugRAvk7jWoZfGndW/z2mTY3RvVnuI2GeMbUhsgXdTeHA5DKD/rQ35c/tie/jVDc3vImKyz4QHGhNPXesCLMAeis55pvVg5m21T54FPaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759783; c=relaxed/simple;
	bh=FiypYvKf6VpX/fvafcOV0jwDzIXIP9N1G7YUY78Mgto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgRZVPVSPOiWY5wpFanqDW4wes/2rMRi4CslI7oClfcIPeQaI17DWEGwtRdurUF68ZIwl9eHHwkidaYcLcAgF8hjT4qtGgM5befSll/ltoy3Kbnj3f032fxj7YsBh8Ya5Ymc8K3ZqPyKLI6FJ/DaEidOvWlHpI/xsz//3zqJo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeZF7r54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeZF7r54"
Received: by smtp.kernel.org (Postfix)
	id 0477FC19424; Fri, 21 Nov 2025 21:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82571C4CEF1;
	Fri, 21 Nov 2025 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763759782;
	bh=FiypYvKf6VpX/fvafcOV0jwDzIXIP9N1G7YUY78Mgto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EeZF7r54BGm0ZwkzOfmMxiXjjvXXjgi8kjBuGCvx6FfJmz5IuUkElZmWMDFRioEBN
	 eNh7m8pYVvU2bKzA6IRZzDCclPgoY3SV2B+5SKe/ITnjjNE7n2RPCBUHO+J7xMOunz
	 ePaHzkX/wjfAfdM6UGtSXo5zoGn08giuehOto+pPoxtw2DK2FlWk9r//72uRliXIKE
	 YSXxilLFiklFM5UWSEolAtTtjkyMgGNXi1nZZV6D/tf9VwwadIJbWI8hYP+fOVbJmW
	 +2+C/wfQjj2Uhd8iOQvy3M8uVTRfpxbsPZWKKNXTr0vbpxFEFUS5rL39jYAYSnwPTD
	 9GLGkjRjFQx0w==
Date: Fri, 21 Nov 2025 13:16:21 -0800
From: Drew Fustini <fustini@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Tenstorrent Devicetree for v6.19
Message-ID: <aSDWpcjVT+pt1R7I@x1>
References: <aPUemXdOFZEdkayE@x1>
 <920f8f04-92dc-464f-807b-d09cc77c5532@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <920f8f04-92dc-464f-807b-d09cc77c5532@app.fastmail.com>

On Fri, Nov 21, 2025 at 09:49:42PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 19, 2025, at 19:23, Drew Fustini wrote:
> > Hi Arnd,
> >
> > Please pull these changes which add Tenstorrent as a vendor and enable
> > support for Blackhole. It adds the appropriate entries in MAINTAINERS.
> > The changes all come from a single series [1] posted by myself. Joel
> > Stanley has reviewed and tested all the patches. Rob acked or reviewed
> > all the bindings patches. W=1 dtbs_check and dt_binding_check produce
> > no warnings.
> >
> > [1] 
> > https://lore.kernel.org/linux-riscv/20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com/
> >
> > Thanks,
> > Drew
> >
> > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> >
> >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:tenstorrent/linux.git tags/tenstorrent-dt-for-v6.19
> >
> 
> I pulled this one manually as you had the wrong URL here, please
> use an https:// url for git pull. You can do this e.g. by adding
> 
> [url "https://github.com"]
>     insteadOf = git@github.com:
> 
> to your .gitconfig.
> 
>        Arnd

Sorry about that. I will make sure I give the correct url next time.

Thanks,
Drew
