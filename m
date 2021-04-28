Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EC8C433B4
	for <soc@archiver.kernel.org>; Wed, 28 Apr 2021 09:52:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 190E7613DA; Wed, 28 Apr 2021 09:52:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B6CC613E7;
	Wed, 28 Apr 2021 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619603540;
	bh=rReFFjuvDhHiQI/geNWM005Q+WIP2z9uyanWOqbA4ws=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2/iuiEtWGP/sVGVwuJcE+0jdXll3ZAVicKbpMHkwD+zpcnn8E8FCulSoUhzLPT68
	 Al8b8Qhjud/5QSvne+PVSRMDtytZf31B2RKkDyNGrn5mUGvH92rxP1AX+VKNEybG7/
	 zOtfTFvLirl/3g3gbpIr/rIZCcqeI8vwLDLgo7zkl97HyQaybzCGvFr8ccRpDB+Vm8
	 1Clua6AHLmRj179JnvzPu7oTwFlBzZ3Hklce+VSMAwQHr7gqEbp7JaZhTsQTKSxX8U
	 3PiJCGbYVuIQKFz6pmFEuRqbMmQJ/8uwtWDifd/3+xAktxikN2R4HeUEcbxcRxOcO0
	 iBitdyZcLl9Lg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	ARM SoC Team <arm@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
Date: Wed, 28 Apr 2021 11:51:58 +0200
Message-Id: <161960350770.2272527.9069383680761503934.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428093148.flrcowzr2dsj7byz@bogus>
References: <20210428093148.flrcowzr2dsj7byz@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 28 Apr 2021 10:31:48 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit d4f9dddd21f39395c62ea12d3d91239637d4805f:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e393cc4e9ce015abc8a68c762dc361cdb0b0db96

       Arnd
