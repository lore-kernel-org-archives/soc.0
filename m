Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA898C433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 19:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1BE8216FD; Mon, 25 Jan 2021 19:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7A922067B;
	Mon, 25 Jan 2021 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611601970;
	bh=U1nPN11Z3rTPNxLQyWxXVsNuqtofi28hKZcIA4D922E=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=H8A7tTnBH8OidUn0zgbpmCJbl6zqs+/iUMkoy6C4nLrSvu29C9EqxmInquJsYN2Bu
	 OadmZyIHJTQPcux4/8VJ9jVnRZIEg+x3BOZoQm+pDCh4x1nlWMZDPM8+ABIQk+47pw
	 eOyMpzV2KG6I6w3cjd3OJsstp+IMfwvTA9xak9PdnT7tFCbiOKw4YucLZ9mWR/D1k+
	 OoUwVvUVBuoOJsAPt2cFMDAP6/tjnMHT0FaGY/etRYnPCGSyUIveLTtg72RRJ6vhjD
	 /OzxayPB+sjW7EJK7tdsA2LjkMZ1SzwUTM7cRYIMvk698blBa/EVrTkRxLuPoG4OcI
	 QwHdZVg6Hb33g==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 0/3] Samsung for v5.12
Date: Mon, 25 Jan 2021 20:12:37 +0100
Message-Id: <20210125191240.11278-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Three tags to pull for v5.12. No dependencies, no order of pulls.

Best regards,
Krzysztof

