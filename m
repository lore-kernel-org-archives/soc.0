Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7CCC433FE
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 14:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A17EAC385B6; Thu,  5 May 2022 14:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840EFC385B2;
	Thu,  5 May 2022 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651759928;
	bh=9kKGbqy7Ax8pQ9tOpNa9LUy0PYX/J1ie6b/fyKllZXI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nawYxfjPhRL4bzwePmnCZmMyAEcpNPqByStxU8odlYldMteDU4ed+80SDfldnVGRF
	 P8oUaAG3ciIy++hjZXwFpITNDBYzKWHLvPDYQRHA4WV3Dqk09grlbSlx9BpCgCXFfd
	 Va3+PIjSJjI+E4pJoansHNPwG1lbD+iP/vzzH+aJR0OzXyBqDxvQl6vlPlb0gP1Mu5
	 1Rb14rmOgakeck1ivZoSTmSHi0jUaelHrQ32h8c3cHQZJRzaFSRuxCAnb5P+V1QKJR
	 dT1Y+eGBgluELc9EUP7KExmvamUOU8Sh/RDNnqknPQauh1ComS/g7CtsHJI80kdO+t
	 YGqYugV54sNMw==
Received: by mail-pj1-f48.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so4222372pjm.1;
        Thu, 05 May 2022 07:12:08 -0700 (PDT)
X-Gm-Message-State: AOAM530idUHMPIIBBCl/YG2FLJDl28FZqyon0ONMN6C1o3fuoE6PZlpd
	ZFh/ux9iw7Dj6YFO1QRBqpQdA5neLVjcTsP9mA==
X-Google-Smtp-Source: ABdhPJx6QoJIEpNhrIGK65CcEF58bMJpnUn8+5tpAp02FbR6n6SHQr1mCw8PWw6zJeBiQ5K3kqI2+chhbc/awm7mApQ=
X-Received: by 2002:a17:90b:4a4e:b0:1dc:55ca:6f33 with SMTP id
 lb14-20020a17090b4a4e00b001dc55ca6f33mr6466106pjb.4.1651759927901; Thu, 05
 May 2022 07:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com> <20220422150952.20587-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20220422150952.20587-3-alexandre.torgue@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 5 May 2022 09:11:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKU28BNrozg20_a_XMUmBhaoDHdodWkzyRoH=VcM2pDjg@mail.gmail.com>
Message-ID: <CAL_JsqKU28BNrozg20_a_XMUmBhaoDHdodWkzyRoH=VcM2pDjg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if "st,stm32mp1-rcc-secure"
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, SoC Team <soc@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Etienne Carriere <etienne.carriere@st.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 10:10 AM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:
>
> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> security support hardened), "clocks" and "clock-names" describe oscillators
> and are required.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

This is now failing in linux-next:

make[1]: *** Deleting file
'Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts'
Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml: found
duplicate key "clocks" with value "{}" (original value: "True")
make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts]
Error 1
./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:64:3:
[error] duplication of key "clocks" in mapping (key-duplicates)
./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:69:3:
[error] duplication of key "clock-names" in mapping (key-duplicates)
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.10/dist-packages/dtschema/lib.py", line
914, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py",
line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 121, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 131, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 674, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 445, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 263, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 294, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 49, column 3
found duplicate key "clocks" with value "{}" (original value: "True")
  in "<unicode string>", line 64, column 3
To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 74, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
