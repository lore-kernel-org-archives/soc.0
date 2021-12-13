Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F1C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C77A4C34605; Mon, 13 Dec 2021 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E40FC34603;
	Mon, 13 Dec 2021 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405979;
	bh=JmgqmHkK719nf9ylNFo3CaD9o8vRqacb3AtosjXYuVk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbJ9DI5fteGUKduZBuRWtobryLE8K0Ns1nMuUjvSx3w8K+bm1GrABiB+X8SIwDTcT
	 TllMhi+7gadERedjyQUcxRxgzqk8V1WDGEw3g4fntl1dGalvivUeqRFH9eDQTQ9O/e
	 yz88k8rIwEviC4hyfco5wt80Vl6Gecv8V9g2Xjkn12hgQd3Or7quRGJYikMINcNqPE
	 tw1BAK8X9FufXafVSFZzJRECjJzlxiUBYeQlh4qNop7Chis20gz1Hu003RfXo+DDcA
	 QD6K9l9vyMTDgEAbgQ6CzpQetGeegIb8CJwKhXKh6H1o5aNe7TWYxOA20rytQfkQ6Z
	 h0fPEZqpE0BNg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	soc@kernel.org,
	arm@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	stable@vger.kernel.org,
	Pedro Batista <pedbap.g@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2] firmware: arm_scpi: Fix string overflow in SCPI genpd driver
Date: Mon, 13 Dec 2021 15:32:51 +0100
Message-Id: <163940588870.928379.6605630703027006673.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211209120456.696879-1-sudeep.holla@arm.com>
References: <20211209120456.696879-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 9 Dec 2021 12:04:56 +0000, Sudeep Holla wrote:
> Without the bound checks for scpi_pd->name, it could result in the buffer
> overflow when copying the SCPI device name from the corresponding device
> tree node as the name string is set at maximum size of 30.
> 
> Let us fix it by using devm_kasprintf so that the string buffer is
> allocated dynamically.

Applied to for-next, thanks!

[1/1] firmware: arm_scpi: Fix string overflow in SCPI genpd driver
      commit: c29ec614f0da82db6edd1fece28ebba5ae656155

       Arnd
