Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E4267F50
	for <soc@lists.linux.dev>; Thu, 13 Mar 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877030; cv=none; b=Kwhd+/R+Yx8uuZ72YZDuKD5NNn92OvT0mOaRUrvFHuhzBhDTmmuRqGdG0EBHzTV2UxVCLXCI6nmDq5df0YapngkKj8ou43drBnGS2+lOYyV2SGCPUykGz6736g46Gmph7KSqRQ+TD7W8tMqGVCLUn4fn5EcmjvsJ6NNngRnOj/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877030; c=relaxed/simple;
	bh=JASbuPnq/fZZqtfMCcxNabCPg2YoMwjcfwmLMkH+GjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JGpVnSjT8cppPfnet/RvHA/6OoFYY3XkbQOt/Ylf3sOkKR4HQyI+MVhhORC+ePaQ32gUJBXefdTCUPDIqGgAK2IKAwgJ8EvFZqIdP1xcJB0M//WDfrUNW76e1+I+kLtmHcf2HNzlQnlSMyYnrRCnAkgadxqQL0411a6Wm0rf83w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=agQ7/Afl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="agQ7/Afl"
Received: by smtp.kernel.org (Postfix)
	id 63E78C4CEE5; Thu, 13 Mar 2025 14:43:50 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 666EEC4CEEA;
	Thu, 13 Mar 2025 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 666EEC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6D3391F92C;
	Thu, 13 Mar 2025 15:43:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1741877015;
	bh=u4y3Mf6vb5tkFjtxo50EBb/g8sSjRTOwS1HEz/JCbvI=; h=From:To:Subject;
	b=agQ7/AflldL57JLuFwV0NTTCbXaKqalGl3674H4jRNx/vwUS6tf0B0t2vB/GAwE6n
	 pZ1yIlKhhQ3OPEGWPOOAlJmbDm+9dxWpoibqB6ibEZnRO6yEr4VmkMMZCGuXAPCs43
	 5uW4BHSEHoTtZDTVZ9kWG01ZYJhKC+Mlt+m4lkuLcbLwzfqehFddXDSMWzUvY910BV
	 WYyqJrRzPI/oDtFW2q3BKbd1W4/dRY31eLKEba1tnq604iqsF20UzIfQp9bS4GHpFF
	 9aK0eYcfS8Kaa3/amZ0DLeD0MIDXvcKvJkzM6yo7qBvo0MqXI/bK51t7OiIVj/sK1/
	 0/lsOtvtX8LIA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded controller
Date: Thu, 13 Mar 2025 15:43:29 +0100
Message-Id: <20250313144331.70591-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Toradex Embedded Controller, currently used
on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.

The EC provides board power-off, reset and GPIO expander functionalities.

Sending it as an RFC to gather initial feedback on it before investing more
time in testing and adding the remaining functionalities, with that said both
the code and the binding are in condition to be wholly reviewed.

Emanuele Ghidoli (2):
  dt-bindings: firmware: add toradex,embedded-controller
  platform: toradex: add preliminary support for Embedded Controller

 .../firmware/toradex,embedded-controller.yaml |  44 +++++
 MAINTAINERS                                   |   7 +
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/toradex/Kconfig              |  18 ++
 drivers/platform/toradex/Makefile             |   1 +
 drivers/platform/toradex/toradex-ec.c         | 155 ++++++++++++++++++
 7 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
 create mode 100644 drivers/platform/toradex/Kconfig
 create mode 100644 drivers/platform/toradex/Makefile
 create mode 100644 drivers/platform/toradex/toradex-ec.c

-- 
2.39.5

