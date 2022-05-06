Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C3BC433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 16:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65168C385B5; Fri,  6 May 2022 16:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDB3C385B0;
	Fri,  6 May 2022 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651854080;
	bh=AxLsv+MlHDtR4Ba4/1Hd2BjJXSVz5vOpyyeEN0wDR9o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NiroyEcvo4HRxc6pDtp969iTGKsGbIqAxNjv2wzaS/L76OtmvBpBFbx7h9IVECfpN
	 +S+/fGWAeTN5NzWGYWQNY5xCY3YWkd1V6TnoHGCWwgJUXI/BD5BOcU4BChQ45FAAKd
	 IQh/q1AQZdgVM6NGh7Vjo4apFlS3LuVBWTscSsPWDlndWUswy4PAffWl+CtIK37Pkz
	 Na3q3/fcpmiGwOVZOtVfy0aChBdpWlcTfNNrwPlDQsaFtBmMCHMcTQ7iKLJtmoduQz
	 CfUCdKCnoUIq8Qdq/WjNWmQ0fG1BU8bKO4IXRvt2DFyFcgkIIgeztoRSgs6yorYx91
	 mnvSGI5i9IJsw==
Received: by mail-pl1-f182.google.com with SMTP id k1so7902612pll.4;
        Fri, 06 May 2022 09:21:20 -0700 (PDT)
X-Gm-Message-State: AOAM530vMYtOuz9CW4z223MBgfMEAeW8EezlWFrVnsc/VpbpHCk/hSNp
	NzCJS6nnBOVJzcegb0lt56XdUWcbd45HykBS/A==
X-Google-Smtp-Source: ABdhPJxGBIsMUehaVlYli55Vk/6Ka2uimhuHRzDr+nnDieEXfg2/cpKCg5fNCcM3zaajVlgGtUfkMrVQQc38ZioO7wU=
X-Received: by 2002:a17:902:7884:b0:15e:e6a8:346 with SMTP id
 q4-20020a170902788400b0015ee6a80346mr4487227pll.151.1651854079794; Fri, 06
 May 2022 09:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com> <CAL_JsqKU28BNrozg20_a_XMUmBhaoDHdodWkzyRoH=VcM2pDjg@mail.gmail.com>
 <edf8f01b-e850-1734-2909-f31cd8b082c5@foss.st.com>
In-Reply-To: <edf8f01b-e850-1734-2909-f31cd8b082c5@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 6 May 2022 11:21:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK5ox681qQFz6b4a8eSaNHJ08XmB2bTE=EZ2Pch0YDJqA@mail.gmail.com>
Message-ID: <CAL_JsqK5ox681qQFz6b4a8eSaNHJ08XmB2bTE=EZ2Pch0YDJqA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if "st,stm32mp1-rcc-secure"
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, SoC Team <soc@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Etienne Carriere <etienne.carriere@st.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 6, 2022 at 5:02 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Rob
>
> On 5/5/22 16:11, Rob Herring wrote:
> > On Fri, Apr 22, 2022 at 10:10 AM Alexandre Torgue
> > <alexandre.torgue@foss.st.com> wrote:
> >>
> >> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> >> security support hardened), "clocks" and "clock-names" describe oscillators
> >> and are required.
> >>
> >> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >
> > This is now failing in linux-next:
> >
> > make[1]: *** Deleting file
> > 'Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts'
> > Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml: found
> > duplicate key "clocks" with value "{}" (original value: "True")
> > make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
> > Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts]
> > Error 1
> > ./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:64:3:
> > [error] duplication of key "clocks" in mapping (key-duplicates)
> > ./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:69:3:
> > [error] duplication of key "clock-names" in mapping (key-duplicates)
> > Traceback (most recent call last):
> >    File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
> >      testtree = dtschema.load(filename, line_number=line_number)
> >    File "/usr/local/lib/python3.10/dist-packages/dtschema/lib.py", line
> > 914, in load
> >      return yaml.load(f.read())
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py",
> > line 434, in load
> >      return constructor.get_single_data()
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 121, in get_single_data
> >      return self.construct_document(node)
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 131, in construct_document
> >      for _dummy in generator:
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 674, in construct_yaml_map
> >      value = self.construct_mapping(node)
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 445, in construct_mapping
> >      return BaseConstructor.construct_mapping(self, node, deep=deep)
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 263, in construct_mapping
> >      if self.check_mapping_key(node, key_node, mapping, key, value):
> >    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
> > line 294, in check_mapping_key
> >      raise DuplicateKeyError(*args)
> > ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
> >    in "<unicode string>", line 49, column 3
> > found duplicate key "clocks" with value "{}" (original value: "True")
> >    in "<unicode string>", line 64, column 3
> > To suppress this check see:
> >      http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys
> > During handling of the above exception, another exception occurred:
> > Traceback (most recent call last):
> >    File "/usr/local/bin/dt-doc-validate", line 74, in <module>
> >      ret = check_doc(f)
> >    File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
> >      print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
> > AttributeError: 'DuplicateKeyError' object has no attribute 'path'
>
> It seems that we have a merge issue between:
>
> patch "dt-bindings: rcc: Add optional external ethernet RX clock properties"
> https://lore.kernel.org/r/20220410220514.21779-1-marex@denx.de
>
> and this one (dt-bindings: clock: stm32mp1: describes clocks if
> "st,stm32mp1-rcc-secure)
>
> On linux-next following part remains and creates issue above:
>
>    clocks:
>      description:
>        Specifies the external RX clock for ethernet MAC.
>      maxItems: 1
>
>    clock-names:
>      const: ETH_RX_CLK/ETH_REF_CLK
>
> I don't know why this part is remaining. In my tree, I took care to take
> Marek patch first to avoid this kind of issue.
>
> Btw, how to fix that ?

Looks like I applied "dt-bindings: rcc: Add optional external ethernet
RX clock properties" too. I've reverted it in my tree.

Rob
