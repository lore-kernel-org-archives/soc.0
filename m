Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C31C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D72D460EE9; Mon, 11 Oct 2021 14:54:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58D7E60EB6;
	Mon, 11 Oct 2021 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964078;
	bh=GhHJ7zCNLddsnb2xrFTWkVGU1ThTQNhVXDdUWUttjKA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K21pbbnTPMK2PHrOmmMfDZ5tAwMRQIeW578HXG6FJfGQsC0jFKFcRlh5P28/j1Xxd
	 eHaKluSsk7W30bcBKCtFD8jv1sOvCJ4NiTZlNAJZN0cUdNJhMB1V9RHBZnvIW/xWEx
	 QgXC46s/aB1gXWeKLKSg+XrdedIPX1EeXLzm6h3O9hjLg68rj+4BAeIzVw6+oub73O
	 mtWSf6gWqw7lYBPZS+mUavO1toVlPkqHgyim13tuRUsveU8pIy/BAVVZzHniAAeruI
	 rHgkZfI4hYOqyQGycZCtEKwCjp3rAXlM+1t/I4DbBQaltlVve4oBtNEtFQzwp0RIrn
	 vrHdeSuMD4p+A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/3] memory: mediatek for v5.16
Date: Mon, 11 Oct 2021 16:54:25 +0200
Message-Id: <163396399128.3170841.5429994690692081151.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211010175836.13302-2-krzysztof.kozlowski@canonical.com>
References: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com> <20211010175836.13302-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 10 Oct 2021 19:58:35 +0200, Krzysztof Kozlowski wrote:
> A topic branch specific to Mediatek.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: f47794f5fa703ac92464709131b86dd9e7567acd

       Arnd
