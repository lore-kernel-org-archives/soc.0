Return-Path: <SRS0=9RWo=DA=suse.cz=dsterba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B5DEB64DC
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 14:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F114C433C9; Fri, 14 Jul 2023 14:05:55 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05234C433C8;
	Fri, 14 Jul 2023 14:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05234C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2D961F747;
	Fri, 14 Jul 2023 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689343551;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfJYvmV12IuAluB3xxpilLWbnnbGqme6TLcXjOvVTys=;
	b=qOb3n5CgUl/kxztnUq+EG3DQjjAw7kU0gPdV+91ITOdnPR5Ruh2eoXbnOwJ1jIVbrkvdTa
	deCwzyBOT7WtSLgxmEYtUL2D6Abfza5mkN4mZ6MTQTxFr/7E/I83KlVs+Z2kIa58M5H9F7
	P152JWT0JFnKDyAikCQCl1wns3Y6bxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689343551;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfJYvmV12IuAluB3xxpilLWbnnbGqme6TLcXjOvVTys=;
	b=8SacSFrMGznoswC3DLlSI9eAQn481Dq8gZ3qFdvYfFr/5pVQhmCFltTS3Vrh5kJCPOvliz
	+xMjlRGwh91cZzCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62C1E138F8;
	Fri, 14 Jul 2023 14:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XKdBFz9WsWRNEwAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 14 Jul 2023 14:05:51 +0000
Date: Fri, 14 Jul 2023 15:59:14 +0200
From: David Sterba <dsterba@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Message-ID: <20230714135914.GI20457@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
> +Overview
> +--------
> +
> +SoC platforms or subarchitectures follow all the rules from
> +Documentation/process/maintainer-soc.rst.  However platforms referencing this

Just a drive by comment, references to highly relevant documents should
be clickable, so :doc:`Documentation/process/maintainer-soc` , with
exceptions like if the document has been referenced already.
