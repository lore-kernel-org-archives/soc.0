Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B05C43381
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 165656523A; Mon,  8 Mar 2021 17:09:58 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D5E65230
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D5E65230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOG-0003Go-1R
	for soc@kernel.org; Mon, 08 Mar 2021 17:09:56 +0000
Received: by mail-wr1-f71.google.com with SMTP id p12so2517250wrn.18
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8TYM4mQkGBM+Vm5jThXgeurS1WNknTfQQR/nCCTS0TA=;
        b=bEzEhRUXjRvWJPA/NULk334YSTHHTRLfd2QcIsxoKn0v2lCrKo05KAsGy+s88crWYJ
         ESEKI00vfJL/0EHW1nP9PqMHnWi9zh5ni7gCC8BPjDhWBUoboF6oVzBo8RW1Fnj4PROx
         EP2iblVT191CPggKiu/N3Y+r2VBaVgNG0tiPBHPVI9QA4oLRwS64Wt+XdDUZtOJIUiKL
         Ql0CBpzbHdPX6rbzkBABWleDCYOnRoJjymJp4q7Ed1Ii+wQoAtWbHtyCebjwpP8rFL9E
         quWalChceoAZSAvIb37R321WB+oN0Z6lOdzgNsRbTP6kFjGBzjZnU72coXnpbBIgZNFS
         Kc1w==
X-Gm-Message-State: AOAM533wlDZfY3U/hbhjIJ6Ea94gWN3YcWPM3d7Dqus2VOogloA6mxgq
	B/4imhnQNShxT/upmsY9Zn8LV0uuTWsWy1ENPBVQ2L/mhUq9/d784qID5KlQR6bGks/SGM55Qed
	bR3VpXzhyNzwD/9twUUWOfyY=
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr23418917wmd.21.1615223395828;
        Mon, 08 Mar 2021 09:09:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG+297APszJHmRk5Kfvv6ww1EBrj8jV/78RETfl4fuasWWF0yJAFcdA2rg9uPD8rMJX6gjtQ==
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr23418891wmd.21.1615223395569;
        Mon, 08 Mar 2021 09:09:55 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 2nd PATCH 00/10] arm64: dts: intel: socfpga: minor cleanups
Date: Mon,  8 Mar 2021 18:09:35 +0100
Message-Id: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi Dinh, Arnd and Olof,

This is just a resend of previous patch.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  dt-bindings: arm: intel,keembay: limit the dtschema to root node
  arm64: dts: intel: socfpga: override clocks by label
  arm64: dts: intel: socfpga_agilex: move clocks out of soc node
  arm64: dts: intel: socfpga_agilex: move timer out of soc node
  arm64: dts: intel: socfpga_agilex: remove default status=okay
  arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
  arm64: dts: intel: socfpga_agilex: use defined for GIC interrupts
  arm64: dts: intel: socfpga_agilex: align node names with dtschema
  arm64: dts: intel: socfpga_agilex_socdk: align LED node names with
    dtschema
  arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names
    with dtschema

 .../bindings/arm/intel,keembay.yaml           |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 222 ++++++++++--------
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  18 +-
 .../dts/intel/socfpga_agilex_socdk_nand.dts   |  18 +-
 .../boot/dts/intel/socfpga_n5x_socdk.dts      |  12 +-
 5 files changed, 144 insertions(+), 128 deletions(-)

-- 
2.25.1

