Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5B3655CD
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857117; cv=none; b=a1yseFLDW6LAlACA6goTqj0xVukIxVMXx275TNDfliDFk3Qf0hOc+0oKabcOKqZ58IuoOR8iAynlUzDk/ujWXsTa0+ou7oDDJFyTWXIusgSyxpvLAiuzZDRIXb9P/QBPY1hxB27cyofQVkHByXz3MV6t7e2Y9rG9oEpBc8mTRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857117; c=relaxed/simple;
	bh=QGSMh8ud2iuBbCEojE3G2e24cQxQ2AWacf72lH3tusw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkPZ03UW0w9/GcEVO3QeDjjRxo0OkZlUy1C9aBMRpdXGRFrnXa2+5lGV/j4VnzFkmCg7FYzqqTOooOEr8Fng7fKO6e9xQapyZCI9eQptDotLgA5YE8cO1pg+pUf2lJnbPblmx8L+DG1nUZTAG6mdoWxqI5OLtTvBTnb49LdosMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9fRWT6U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9fRWT6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043C01F000FF;
	Thu,  1 Oct 2026 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857116;
	bh=5jRLHhR2W/8VdRkQx6s/u8EG98t23x3ILhs/TN4rQR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9fRWT6UdSEXG+t/3iyGsbl5Vb/eEBlFFn9eWdvVby+V4l9fNdQplYf8WyNQcf3Zj
	 Kh+iay3pmu5Dh3UTrd3eY2UOejJDK4DlTk3wjM1tN4eoywJvX4lK4UwQdbcjHiJB2e
	 pKkyeCZgE8RQx/tUeRAWoKE2s9GeWFnNaHyg8qCcR01iZIKhjiQ5AhKdr+OfFy3+z2
	 ijkxwQ6bXcxAQVKjk2VE9htG83+Qm+KiG9DkcmXpUPQBTwGt4GN0Hby0KDHoa/pafi
	 PMiX71vzyYv7fGI2f7vVum2EjnHOHhJnvnbphaVT2ZJ+lNNV7h+aEqU8SNlvtol+op
	 XrDarLNLua5NA==
Date: Thu, 1 Oct 2026 14:18:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: SoC Team <soc@lists.linux.dev>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: fvp/juno: Updates for v7.4
Message-ID: <20261001-merciful-starling-of-opposition-cc43e3@quoll>
References: <20260928065048.2492112-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928065048.2492112-1-sudeep.holla@kernel.org>

On Mon, Sep 28, 2026 at 07:50:47AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.4
> 
> for you to fetch changes up to d8e88ad6f769ec55d3d8510dc53c2b08ddfea645:
> 
>   arm64: dts: fvp: Add additional PCIe memory region (2026-09-16 09:20:29 +0100)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

