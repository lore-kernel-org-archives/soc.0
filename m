Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76EFC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ABE6B60EFE; Mon, 11 Oct 2021 14:54:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E62660EE2;
	Mon, 11 Oct 2021 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964080;
	bh=8kpPHKGK0SLvrq00cwthXwJSODfl5q6oMN0XEZnxUl0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4Rcq/vVHr/uSNF2G6yBlAhdAyTSp4ZSZn7SQ50MkaftY7iAdaOYSwHw4yZTq2W3J
	 SsjUtwA2CNmidJpXaLC0k6bycRVPxb5PTxc+7vGt4FWWGRUvqh+ggUgwlTMLX2/yEF
	 uIO88sR1nJi3RPrg1X919buyuRdXCocMSHfw72cGtKKYD5RMOJms8yaojRaKLDl56g
	 sz2Ee2Uy3WQvnKM+P3H6/MGTOzlzz6tt5up+tSD+PvwtAEcW+SR0VGv/aI1O/CM3w9
	 nKF3vgGow/Go4cd2hzKyfSpKKkf31BaHjqTxbBaM5hTUPovzZCk+/fdaB6K+XSa5+T
	 oSa7f8lF00ONA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 3/3] memory: tegra for v5.16
Date: Mon, 11 Oct 2021 16:54:26 +0200
Message-Id: <163396399122.3170841.2655734565595280319.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211010175836.13302-3-krzysztof.kozlowski@canonical.com>
References: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com> <20211010175836.13302-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 10 Oct 2021 19:58:36 +0200, Krzysztof Kozlowski wrote:
> A topic branch specific to Tegra.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 14a7b467a65449ebc346e520a5ed59fafa809169

       Arnd
