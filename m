Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F91DD867
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888927; cv=none; b=nsVunuvgivmEgQFfB6TrvNZLmNAKyswu036eWxXKW2DjvOtGoKPtwuQx8MBoQb4rGWUN86jema+oBEq1NU7d/xHkp8fujA+J+53sekvmGI64tn1qOJclC+4jdK/1aIVf2DZ38NuqX701L1dr12w9PKgD3wiIUqmh3KT9Mwh0etM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888927; c=relaxed/simple;
	bh=2W3lHOkrvwwmFq2Br1SOMNGz4j/akgV+dPVRJ5Btkmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccl30VGLmATVDi0+bAtdbedYCiFDjtULIl+aVp2M+5w8EYuzeFpIMtppb51UH1IYOa0Y75XYWAADennppbhEHOdHShErrRP8/RM2LeZ3WiOt8q1xCs5KsXPPF6G6rbdI8pNS9SBcnjtKpUI410pNEuZ03J76kbJTMY6Fe9YVzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSkgsRLw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSkgsRLw"
Received: by smtp.kernel.org (Postfix)
	id 9B329C4CED0; Wed,  6 Nov 2024 10:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C598C4CECD;
	Wed,  6 Nov 2024 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730888927;
	bh=2W3lHOkrvwwmFq2Br1SOMNGz4j/akgV+dPVRJ5Btkmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSkgsRLwUOmH1VC530NAKtxbFJ7XoNIoJQDmcHIwPdVlIfSuZBlu8Xep+C4E1+Qdi
	 hle6cfWXAIjx/tj56usOZ2gFk1FfO2bpkhHWqNzreiWkO6VQQXHyiUh1Ky3aEcrjq8
	 pYz9YAi/KzCUIVmGXqjM1IvN7IPuoOUHFOGhQm1ROgm1OhsOmd+dSZ3WNaaxseKGIl
	 YaalrsQ0Pxk6L0nWHp9lF/yKe/lk4954It+WnvVMcdSa24ItROsOE1fVP/ADKmXm79
	 UK/jREBk7Xty79/7MncmEfPA6+8tCZWUT1q+6SQW86Up1SXLqHzCjyBPPBI1Nom+6/
	 a6iEKpCEoEr7w==
Date: Wed, 6 Nov 2024 10:28:40 +0000
From: Lee Jones <lee@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <20241106102840.GN1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104141924.18816-2-kabel@kernel.org>

On Mon, 04 Nov 2024, Marek Behún wrote:

> Move the command execution functions from the turris-omnia-mcu platform
> driver private header to the global turris-omnia-mcu-interface.h header,
> so that they can be used by the LED driver.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
>  3 files changed, 136 insertions(+), 131 deletions(-)

Who needs to Ack this for me to take it via the LED tree?

-- 
Lee Jones [李琼斯]
