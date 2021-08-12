Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21610C432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1E0860E52; Thu, 12 Aug 2021 21:06:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA4561038;
	Thu, 12 Aug 2021 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802368;
	bh=oKXU65MF07vmCV1rea9TVQd6CIrJZzHSlgKopzlGqKE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P/8siX7swHkm0nuK2JfRa3KM5OK/ADcLPHKHx8Vq2gA0MdKDtBy7/bUzlTU7B3PUr
	 WBPurRakpo2pJlA9Rgxx7JtvgnN7fnfReo59uTkqXhCVZetwhIpj8M/qsAaM4ULBwg
	 Tq5O8UzvlpEHoGwFmPVuy6dQf6QQpGEHjZ0iRB73uJ8+Q6KdqTIab8qd1JDMFDOtrO
	 tffak2EPDVfawG5iyRWbep76vhBXr97Hg7+sX+WGxjlQUPrIXoPzmb9s2SqlbNn7LF
	 nAOA0HAwueC5EOUz4PzCqpeyo7vreHobwiEMhw+BgCwwmHEIcFYwyVM2HiLX5WykIp
	 9HL0BZ6Eg1E4A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Patrice CHOTARD <patrice.chotard@foss.st.com>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	"arm@kernel.org" <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
	Alain Volmat <avolmat@me.com>
Subject: Re: [GIT PULL] STi DT update for v5.15 #1
Date: Thu, 12 Aug 2021 23:05:44 +0200
Message-Id: <162880206103.1376011.9460289595883893367.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
References: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 6 Aug 2021 09:45:12 +0200, Patrice CHOTARD wrote:
> This STi DT update is dedicated for v5.15.
> It provides mainly clocks update and introduces a new board.
> 
> Thanks
> Patrice
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f3e22d32e4ddef2980ff9c9c401f7b948030e0be

       Arnd
