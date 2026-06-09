Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B65401A01
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005593; cv=none; b=N2XJpix2ouCaIvaSjEIP6QELf+A6yC4MHw5G/pSsoNrMuftyxBU9wYx1d9oQagK67cOfIQVuROVXftRIg+VotkILZgkYlDcP/4MdHtDuRFOdk6NmVDQde+Z7Mogb1nzhoO4PaKC00JyxUCaoz7fJCx4n713/3Ne5+3YZTe5Z210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005593; c=relaxed/simple;
	bh=XWO1jpgKwoF2mIZ699M7q7ZCt7nn0b1kbEIeJhAMLDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9PJ0wJ+Y378rHDLuC9M4CSWwJiAgdQ5UJOHJMLSTLxOER9Y0ib3gT2pMs8Ez58cINRyuFnW72qMs9DJGlZKnAjG8sQp5779l5ap+pyvn0tpNdFoQNlEppsOK1GYZqyuHU7TmnU1EJlUfZea8Yau/kv3ufxJuEs9vUhLirJrz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/ZwcKmw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/ZwcKmw"
Received: by smtp.kernel.org (Postfix)
	id 9F9221F0089F; Tue,  9 Jun 2026 11:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B77E1F00893;
	Tue,  9 Jun 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005592;
	bh=VlXt+ZybZsncmnBJW1Bj+bdrQxweMBWKapap64spOHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U/ZwcKmwj6er9JEd1XP1dPWNkQqOrp1JehNoKh9PeyThlOmnYXM/ipNLFObu8tNxW
	 +ZMvLumVFQMPYC8OnYGeRpF2UORVB85Sd9IS8kRLh+uWStah6cX77ZmJyKjU1qouBz
	 Bobt+DO/W+eiRHniiFEF83SCKY5kGbd2pEf5QTxleT2zDoDEk+q7XYaTP3lRUcGSb5
	 e6AbpSa3vwmvqUkkQMSIHcJCbVHwDjDwZHhu9fY2bKf9NAkIOgonn0hoi0/joczgWr
	 fdSPqjrdtZ3ytEp8Qk0fGg+y2Qsm3W43j3q07Ma19J0GO5jfjabY3vvsZHkYWUMeTP
	 yWYPEAlfvAnpQ==
Date: Tue, 9 Jun 2026 13:46:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
	Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
	Andy Gross <agross@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Paul Walmsley <pjw@kernel.org>, Drew Fustini <dfustini@oss.tenstorrent.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Tenstorrent devicetree changes for v7.2
Message-ID: <20260609-wise-fragrant-sturgeon-4e5eda@quoll>
References: <ah4Qfro/wUyhByF8@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah4Qfro/wUyhByF8@x1>

On Mon, Jun 01, 2026 at 04:06:38PM -0700, Drew Fustini wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-dt-for-v7.2
> 
> for you to fetch changes up to 33583baeb1ba7d328e6a9775d889036900b74cdb:
> 
>   dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU (2026-05-23 17:14:35 -0700)
> 

Thanks, applied

Best regards,
Krzysztof

