Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8281C64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDBFAC4339B; Fri, 24 Feb 2023 09:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224C4C433EF;
	Fri, 24 Feb 2023 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677231469;
	bh=pZ7fjVn8kP+6sOWRv3sy1QP/MJ/0mLIoQEhLwQR+mg8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FkC1WczwgpJIfR/aWkrJ9tENk2qvKILPPbx01vfgAPTLDBs135iHrvKx9CVRbAiM2
	 ldWuFWo7oo5RzEz9yndX/AqiiM5lLT+36sdiOO7OUKCkDRzogECE+emXzVgGWuc1Vq
	 djWtsVCF4EavIuKHp2DPzTGlsPIn7vWLPAOD2P6ksO/4O/HFpr41CxSurUV/Tew9Hs
	 L2ddiU4LuadulGWphs84I1qUSihIv/Oqz0bfbu/gh5JlkjLLJrWPMi3BxGAecLqLEI
	 oy26VtD4af47XYUtXLqFxO2KzcafturPrcGozg6ULBaWW/sixbRQgIBSIGb4byOJlJ
	 7lZ6+1RY5xmIg==
Date: Fri, 24 Feb 2023 09:37:44 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, pavel@ucw.cz,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 5/8] leds: Add support for Turris 1.x LEDs
Message-ID: <Y/iFaIY0FcZZWy+9@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-6-pali@kernel.org>
 <Y9Ozg2O41a2iijMc@google.com>
 <9b57bf80-6a3e-a96d-56e7-f93ab5840525@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b57bf80-6a3e-a96d-56e7-f93ab5840525@kernel.org>

On Fri, 24 Feb 2023, Krzysztof Kozlowski wrote:

> On 27/01/2023 12:20, Lee Jones wrote:
> > Pavel, are you happy with the user-space interface?
> > 
> 
> Although not about user-space but about code - entire review was ignored
> by Pali and not implemented:
> https://lore.kernel.org/all/CAHp75Vcr6o2rm+T6Tr8sS4VXCLVHtmLPWy-njOKAvO4AcZoW=A@mail.gmail.com/

I just submitted a review too.  Lots to work on.

-- 
Lee Jones [李琼斯]
